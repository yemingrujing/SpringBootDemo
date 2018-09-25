package com.example.util.chinapay;

import org.bouncycastle.crypto.AsymmetricBlockCipher;
import org.bouncycastle.crypto.engines.RSAEngine;
import org.bouncycastle.crypto.params.RSAKeyParameters;
import org.bouncycastle.crypto.params.RSAPrivateCrtKeyParameters;

import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.interfaces.RSAPrivateCrtKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

public class SecureUtil {
    public static byte[] sign(byte[] dataBytes, PrivateKey priKey, String sigAlgName)
            throws Exception {
        Signature signature = Signature.getInstance(sigAlgName);
        signature.initSign(priKey);
        signature.update(dataBytes);
        byte[] signByte = signature.sign();

        return signByte;
    }

    public static boolean verify(byte[] dataBytes, byte[] signBytes, PublicKey pubKey, String sigAlgName)
            throws Exception {
        Signature signature = Signature.getInstance(sigAlgName);
        signature.initVerify(pubKey);
        signature.update(dataBytes);

        return signature.verify(signBytes);
    }

    public static byte[] encryptData(byte[] dataBytes, byte[] keyBytes)
            throws Exception {
        return encryptByPublicKeyRSALong(dataBytes, keyBytes);
    }

    public static byte[] decryptData(byte[] dataBytes, byte[] keyBytes)
            throws Exception {
        return decryptByPrivateKeyRSALong(dataBytes, keyBytes);
    }

    public static byte[] pin2PinBlockWithCardNO(String aPin, String aCardNO) {
        byte[] tPinByte = pin2PinBlock(aPin);
        if (SecssUtil.isEmpty(tPinByte)) {
            return null;
        }
        if (aCardNO.length() == 11) {
            aCardNO = "00" + aCardNO;
        } else if (aCardNO.length() == 12) {
            aCardNO = "0" + aCardNO;
        }
        byte[] tPanByte = formatPan(aCardNO);
        if (SecssUtil.isEmpty(tPanByte)) {
            return null;
        }
        byte[] tByte = new byte[8];
        for (int i = 0; i < 8; i++) {
            tByte[i] = ((byte) (tPinByte[i] ^ tPanByte[i]));
        }
        return tByte;
    }

    public static byte[] pin2PinBlock(String aPin) {
        int tTemp = 1;
        int tPinLen = aPin.length();

        byte[] tByte = new byte[8];
        try {
            tByte[0] = ((byte) Integer.parseInt(
                    new Integer(tPinLen).toString(), 10));
            int i = 0;
            if (tPinLen % 2 == 0) {
                for (i = 0; i < tPinLen; ) {
                    String a = aPin.substring(i, i + 2);
                    tByte[tTemp] = ((byte) Integer.parseInt(a, 16));
                    if ((i == tPinLen - 2) && (tTemp < 7)) {
                        for (int x = tTemp + 1; x < 8; x++) {
                            tByte[x] = -1;
                        }
                    }
                    tTemp++;
                    i += 2;
                }
            } else {
                for (i = 0; i < tPinLen - 1; ) {
                    String a = aPin.substring(i, i + 2);
                    tByte[tTemp] = ((byte) Integer.parseInt(a, 16));
                    if (i == tPinLen - 3) {
                        String b =
                                aPin.substring(tPinLen - 1) +
                                        "F";
                        tByte[(tTemp + 1)] = ((byte) Integer.parseInt(b, 16));
                        if (tTemp + 1 < 7) {
                            for (int x = tTemp + 2; x < 8; x++) {
                                tByte[x] = -1;
                            }
                        }
                    }
                    tTemp++;
                    i += 2;
                }
            }
        } catch (Exception e) {
            return null;
        }
        return tByte;
    }

    public static byte[] formatPan(String aPan) {
        int tPanLen = aPan.length();
        byte[] tByte = new byte[8];
        int temp = tPanLen - 13;
        try {
            tByte[0] = 0;
            tByte[1] = 0;
            for (int i = 2; i < 8; i++) {
                String a = aPan.substring(temp, temp + 2);
                tByte[i] = ((byte) Integer.parseInt(a, 16));
                temp += 2;
            }
        } catch (Exception e) {
            return null;
        }
        return tByte;
    }

    private static byte[] encryptByPublicKeyRSALong(byte[] data, byte[] keyBytes)
            throws Exception {
        try {
            X509EncodedKeySpec x509KeySpec = new X509EncodedKeySpec(keyBytes);
            KeyFactory keyFactory = KeyFactory.getInstance(SecssConstants.ENC_ALG_PREFIX, SecssConstants.DEFAULT_PROVIDER);
            RSAPublicKey publicKey2 = (RSAPublicKey) keyFactory
                    .generatePublic(x509KeySpec);

            BigInteger modulus = publicKey2.getModulus();
            BigInteger exponent = publicKey2.getPublicExponent();
            RSAKeyParameters pubKey = new RSAKeyParameters(false, modulus,
                    exponent);
            AsymmetricBlockCipher rsaCiph = new RSAEngine();
            rsaCiph.init(true, pubKey);

            int blockSize = rsaCiph.getInputBlockSize();
            int outputSize = rsaCiph.getOutputBlockSize();
            int leavedSize = data.length % blockSize;
            int blocksSize = leavedSize != 0 ? data.length / blockSize + 1 :
                    data.length / blockSize;
            byte[] raw = new byte[outputSize * blocksSize];
            int i = 0;
            byte[] encBytes = null;
            while (data.length - i * blockSize > 0) {
                if (data.length - i * blockSize > blockSize) {
                    encBytes = rsaCiph.processBlock(data, i * blockSize,
                            blockSize);
                } else {
                    encBytes = rsaCiph.processBlock(data, i * blockSize,
                            data.length - i * blockSize);
                }
                System.arraycopy(encBytes, 0, raw, i * outputSize, outputSize);
                i++;
            }
            return raw;
        } catch (Exception e) {
            throw e;
        }
    }

    private static byte[] decryptByPrivateKeyRSALong(byte[] data, byte[] keyBytes)
            throws Exception {
        try {
            PKCS8EncodedKeySpec pkcs8KeySpec = new PKCS8EncodedKeySpec(keyBytes);
            KeyFactory keyFactory2 = KeyFactory.getInstance(SecssConstants.ENC_ALG_PREFIX, SecssConstants.DEFAULT_PROVIDER);
            RSAPrivateCrtKey privateKey2 = (RSAPrivateCrtKey) keyFactory2
                    .generatePrivate(pkcs8KeySpec);

            BigInteger mod = privateKey2.getModulus();
            BigInteger pubExp = privateKey2.getPublicExponent();
            BigInteger privExp = privateKey2.getPrivateExponent();
            BigInteger pExp = privateKey2.getPrimeExponentP();
            BigInteger qExp = privateKey2.getPrimeExponentQ();
            BigInteger p = privateKey2.getPrimeP();
            BigInteger q = privateKey2.getPrimeQ();
            BigInteger crtCoef = privateKey2.getCrtCoefficient();
            RSAKeyParameters privParameters = new RSAPrivateCrtKeyParameters(
                    mod, pubExp, privExp, p, q, pExp, qExp, crtCoef);
            AsymmetricBlockCipher eng = new RSAEngine();
            eng.init(false, privParameters);

            int blockSize = eng.getInputBlockSize();
            int outputSize = eng.getOutputBlockSize();
            int leavedSize = data.length % blockSize;
            int blocksSize = leavedSize != 0 ? data.length / blockSize + 1 :
                    data.length / blockSize;
            byte[] raw = new byte[outputSize * blocksSize];
            int i = 0;
            int count = 0;
            byte[] decData = null;
            while (data.length - i * blockSize > 0) {
                if (data.length - i * blockSize > blockSize) {
                    decData = eng.processBlock(data, i * blockSize, blockSize);
                    System.arraycopy(decData, 0, raw, i * outputSize,
                            outputSize);
                    count += outputSize;
                } else {
                    decData = eng.processBlock(data, i * blockSize, data.length -
                            i * blockSize);
                    System.arraycopy(decData, 0, raw, i * outputSize,
                            decData.length);
                    count += decData.length;
                }
                i++;
            }
            byte[] resultRaw = new byte[count];
            System.arraycopy(raw, 0, resultRaw, 0, count);
            return resultRaw;
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * union解密
     *
     * @param token
     * @return
     * @throws Exception
     */
    public static String unionDecrypt(String token) throws Exception {
        return EncrypDES.decrypt(token, EncrypDES.unionSMS);
    }

    /**
     * union加密
     *
     * @param token
     * @return
     * @throws Exception
     */
    public static String unionEncrypt(String token) throws Exception {
        return EncrypDES.encrypt(token, EncrypDES.unionSMS);
    }
}
