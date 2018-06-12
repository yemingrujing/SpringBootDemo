package com.example.util.result;

import org.apache.commons.lang3.StringUtils;

/**
 * ajax返回结果封装
 *
 * @author Wei.Guang
 * @create 2018-06-12 17:27
 **/
public class AjaxResult {

    public static final int CODE_SUCCESS = ErrorMessageEnum.操作成功.getIntValue();

    public static final int CODE_FAILED = ErrorMessageEnum.操作失败.getIntValue();

    private int code;

    private String message;

    private Object data;

    private AjaxResult(int code, Object data, String message) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public Object getData() {
        return data;
    }

    public boolean isSuccess() {
        return CODE_SUCCESS == code;
    }

    public boolean isFailure() {
        return CODE_SUCCESS != code;
    }

    public static final AjaxResult success() {
        return new AjaxResult(CODE_SUCCESS, StringUtils.EMPTY, ErrorMessageEnum.操作成功.name());
    }

    public static final AjaxResult success(Object data) {
        return new AjaxResult(CODE_SUCCESS, data, ErrorMessageEnum.操作成功.name());
    }

    public static final AjaxResult success(Object data, String message) {
        return new AjaxResult(CODE_SUCCESS, data, message);
    }

    public static final AjaxResult success(ErrorMessageEnum r, Object data) {
        return new AjaxResult(r.getIntValue(), data, r.name());
    }

    public static final AjaxResult failed() {
        return new AjaxResult(CODE_FAILED, StringUtils.EMPTY, ErrorMessageEnum.操作失败.name());
    }

    public static final AjaxResult failed(String message) {
        return new AjaxResult(CODE_FAILED, StringUtils.EMPTY, message);
    }

    public static final AjaxResult failed(Object data, String message) {
        return new AjaxResult(CODE_FAILED, data, message);
    }

    public static final AjaxResult failed(Object data) {
        return new AjaxResult(CODE_FAILED, data, ErrorMessageEnum.操作失败.name());
    }

    public static final AjaxResult failed(ErrorMessageEnum err) {
        return new AjaxResult(err.getIntValue(), StringUtils.EMPTY, err.name());
    }

    public static final AjaxResult failed(int code, Object data, String message) {
        return new AjaxResult(code, data, message);
    }

    public int getCode() {
        return code;
    }
}
