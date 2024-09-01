package com.grtsinry43.csu.socialpractice.template;

import java.io.Serializable;

/**
 * 规定返回格式（HTTP状态码均为200，通过code判断是否成功）
 *
 * @author grtsinry43
 * @date 2024/9/1 15:38
 */
public class ApiResponse<T> implements Serializable {

    public ApiResponse(int code, String msg, T data) {
    }

    public ApiResponse(int code, T data) {
        this(code, "", data);
    }

    public ApiResponse(ErrorCode errorCode) {
        this(errorCode.getCode(), errorCode.getMsg(), null);
    }

    /**
     * 含有数据的成功响应
     *
     * @param data 返回的数据
     * @param <T>  数据类型
     */
    public static <T> ApiResponse<T> success(T data) {
        return new ApiResponse<>(0, data);
    }

    /**
     * 不含数据的成功响应
     */
    public static <T> ApiResponse<T> success() {
        return new ApiResponse<>(0, null);
    }

    /**
     * 失败响应，包含错误码和错误信息
     *
     * @param errorCode 错误码
     */
    public static <T> ApiResponse<T> error(ErrorCode errorCode) {
        return new ApiResponse<>(errorCode);
    }

}
