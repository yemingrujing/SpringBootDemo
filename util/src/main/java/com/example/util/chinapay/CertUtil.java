package com.example.util.chinapay;

import cn.hutool.core.io.resource.ClassPathResource;
import com.example.util.unionpay.LogUtil;
import lombok.extern.slf4j.Slf4j;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.io.IOException;
import java.io.InputStream;
import java.security.*;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.Enumeration;
import java.util.Properties;

@Slf4j
public class CertUtil {
    private KeyStore keyStore;
    private X509Certificate verifyCert;
    private PrivateKey priKey;
    private PublicKey pubKey;
    private String signCertId;
    private SecssConfig secssConfig;

    public SecssConfig getSecssConfig() {
        return this.secssConfig;
    }

    public static synchronized CertUtil init()
            throws SecurityException {
        CertUtil certUtil = new CertUtil();
        certUtil.secssConfig = SecssConfig.defaultInit();
        certUtil.initSignCert();
        certUtil.initVerifyCert();

        return certUtil;
    }

    public static synchronized CertUtil init(Properties pros)
            throws SecurityException {
        CertUtil certUtil = new CertUtil();
        certUtil.secssConfig = SecssConfig.specifyInit(pros);
        certUtil.initSignCert();
        certUtil.initVerifyCert();
        return certUtil;
    }

    public void initSignCert()
            throws SecurityException {
        try {
            String signFile = this.secssConfig.getSignFile();
            if (SecssUtil.isEmpty(signFile)) {
                throw new SecurityException(SecssConstants.SIGN_CERT_ERROR);
            }
            String signFilePwd = this.secssConfig.getSignFilePwd();
            if (SecssUtil.isEmpty(signFilePwd)) {
                throw new SecurityException(SecssConstants.SIGN_CERT_PWD_ERROR);
            }
            String signCertType = this.secssConfig.getSignCertType();
            if (SecssUtil.isEmpty(signCertType)) {
                throw new SecurityException(SecssConstants.SIGN_CERT_TYPE_ERROR);
            }
            this.keyStore = getKeyStore(signFile, signFilePwd, signCertType);

            initPriKey();
        } catch (SecurityException e) {
            throw e;
        } catch (Exception e) {
            log.error("init sign cert error", e);
            throw new SecurityException(SecssConstants.INIT_SIGN_CERT_ERROR);
        }
    }

    /* Error */
    public void initVerifyCert() throws SecurityException {
        String verifyFile = this.secssConfig.getVerifyFile();
        if (SecssUtil.isEmpty(verifyFile)) {
            throw new SecurityException(SecssConstants.VERIFY_CERT_ERROR);
        } else {
            CertificateFactory cf = null;
            //FileInputStream in = null;
            InputStream in = null;

            try {
                cf = CertificateFactory.getInstance("X.509");
                //in = new FileInputStream(verifyFile);
                in = new ClassPathResource(verifyFile).getStream();
                this.verifyCert = (X509Certificate) cf.generateCertificate(in);
                this.pubKey = this.verifyCert.getPublicKey();
                this.initPubKey();
                if (in != null) {
                    try {
                        in.close();
                    } catch (IOException var16) {
                        ;
                    }
                }
            } catch (Exception var17) {
                LogUtil.writeErrorLog("初始化验签证书异常", var17);
                if (in != null) {
                    try {
                        in.close();
                    } catch (IOException var15) {
                        ;
                    }
                }

                throw new SecurityException(SecssConstants.INIT_VERIFY_CERT_ERROR);
            } finally {
                if (in != null) {
                    try {
                        in.close();
                    } catch (IOException var14) {
                        ;
                    }
                }

            }

        }
    }

    public void reloadSignCert(String certPath, String pass)
            throws SecurityException {
        try {
            String signCertType = this.secssConfig.getSignCertType();
            if (SecssUtil.isEmpty(signCertType)) {
                throw new SecurityException(SecssConstants.SIGN_CERT_TYPE_ERROR);
            }
            this.keyStore = getKeyStore(certPath, pass, signCertType);
        } catch (SecurityException e) {
            throw e;
        } catch (Exception e) {
            throw new SecurityException(SecssConstants.RELOADSC_GOES_WRONG);
        }
    }

    public KeyStore getKeyStore(String signFile, String signFilePwd, String signFileType)
            throws SecurityException, Exception {
        try {
            log.info(String.format("signFile=%s,signFileType=%s", new Object[]{
                    signFile, signFileType}));
            KeyStore ks = null;
            if ("JKS".equals(signFileType)) {
                ks = KeyStore.getInstance(signFileType, "SUN");
            } else if ("PKCS12".equals(signFileType)) {
                Security.addProvider(new BouncyCastleProvider());
                ks = KeyStore.getInstance(signFileType);
            } else {
                throw new SecurityException(SecssConstants.SIGN_CERT_TYPE_ERROR);
            }
            // FileInputStream fis = new FileInputStream(signFile);
            InputStream in = new ClassPathResource(signFile).getStream();
            char[] nPassword = null;
            nPassword = SecssUtil.isEmpty(signFilePwd) ? null : signFilePwd
                    .toCharArray();
            ks.load(in, nPassword);
            in.close();
            return ks;
        } catch (SecurityException e) {
            throw e;
        } catch (Exception e) {
            if (((e instanceof KeyStoreException)) &&
                    ("PKCS12".equals(signFileType))) {
                Security.removeProvider("BC");
            }
            throw e;
        }
    }

    protected void initPriKey()
            throws SecurityException {
        try {
            Enumeration aliasenum = this.keyStore.aliases();
            String keyAlias = null;
            while (aliasenum.hasMoreElements()) {
                keyAlias = (String) aliasenum.nextElement();
                log.info(String.format("keyAlias=%s", new Object[]{keyAlias}));
                if (keyAlias.equals(this.secssConfig.getSignFileAlias())) {
                    break;
                }
                this.priKey = ((PrivateKey) this.keyStore.getKey(keyAlias, this.secssConfig
                        .getSignFilePwd().toCharArray()));
                if (this.priKey != null) {
                    break;
                }
            }
        } catch (Exception e) {
            log.error("获取私钥异常", e);
            throw new SecurityException(SecssConstants.GET_PRI_KEY_ERROR);
        }
    }

    public String getSignCertId()
            throws SecurityException {
        try {
            Enumeration aliasenum = this.keyStore.aliases();
            String keyAlias = null;
            if (aliasenum.hasMoreElements()) {
                keyAlias = (String) aliasenum.nextElement();
            }
            X509Certificate cert = (X509Certificate) this.keyStore
                    .getCertificate(keyAlias);
            this.signCertId = cert.getSerialNumber().toString();
            return this.signCertId;
        } catch (Exception e) {
            log.error("获取证书编号异常", e);
            throw new SecurityException(SecssConstants.GET_CERT_ID_ERROR);
        }
    }

    protected void initPubKey() {
        this.pubKey = this.verifyCert.getPublicKey();
    }

    public PrivateKey getPriKey() {
        return this.priKey;
    }

    public PublicKey getPubKey() {
        return this.pubKey;
    }
}
