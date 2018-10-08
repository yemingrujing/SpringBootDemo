package com.example.util.chinapay;

public class SecurityException
        extends Exception {
    private static final long serialVersionUID = 1L;
    private String errCode;

    public SecurityException() {
    }

    public SecurityException(String errCode) {
        this.errCode = errCode;
    }

    public String getErrCode() {
        return this.errCode;
    }

    public void setErrCode(String errCode) {
        this.errCode = errCode;
    }
}
