package cn.sixmillions.blog.common.api;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.Instant;

/**
 * 统一返回包装
 *
 * @author six
 * @date 2024/01/26
 */
@SuppressWarnings("unused")
@Data
public class R<T> implements Serializable {


    @Serial
    private static final long serialVersionUID = 2750244502793542248L;

    /**
     * 状态码
     */
    private int code;

    /**
     * 是否成功
     */
    private boolean success;

    /**
     * 返回消息
     */
    private String message;

    /**
     * 发生时间
     */
    private Long time;

    /**
     * 承载数据
     */
    private T data;

    /**
     * 错误代码
     */
    private String errorCode;

    public R() {

    }

    private R(IResultCode resultCode, T data, String message) {
        this(resultCode.getCode(), data, message);
    }

    private R(IResultCode resultCode) {
        this(resultCode, null, resultCode.getMessage());
    }

    private R(IResultCode resultCode, String message) {
        this(resultCode, null, message);
    }

    private R(IResultCode resultCode, T data) {
        this(resultCode, data, resultCode.getMessage());
    }

    private R(IResultCode resultCode, T data, String errorCode, String message) {
        this(resultCode.getCode(), data, errorCode, message);
    }

    private R(int code, T data, String message) {
        this.code = code;
        this.data = data;
        this.message = message;
        this.success = ResultCode.SUCCESS.getCode() == code;
        this.time = Instant.now().getEpochSecond();
    }

    private R(int code, T data, String errorCode, String message) {
        this.code = code;
        this.data = data;
        this.message = message;
        this.success = ResultCode.SUCCESS.getCode() == code;
        this.time = Instant.now().getEpochSecond();
        this.errorCode = errorCode;
    }

    public static <T> R<T> data(T data) {
        return data(data, "ok");
    }

    public static <T> R<T> data(T data, String msg) {
        return data(200, data, msg);
    }

    public static <T> R<T> data(int code, T data, String msg) {
        return new R<>(code, data, data == null ? "暂无承载数据" : msg);
    }

    public static <T> R<T> success(String msg) {
        return new R<>(ResultCode.SUCCESS, msg);
    }

    public static <T> R<T> success(IResultCode resultCode) {
        return new R<>(resultCode);
    }

    public static <T> R<T> success(IResultCode resultCode, String msg) {
        return new R<>(resultCode, msg);
    }

    public static <T> R<T> fail(String msg) {
        return new R<>(ResultCode.FAILURE, msg);
    }

    public static <T> R<T> fail(String errorCode, String msg) {
        return new R<>(ResultCode.FAILURE, null, errorCode, msg);
    }

    public static <T> R<T> fail(int code, String msg) {
        return new R<>(code, null, msg);
    }

    public static <T> R<T> fail(IResultCode resultCode) {
        return new R<>(resultCode);
    }

    public static <T> R<T> fail(IResultCode resultCode, String msg) {
        return new R<>(resultCode, msg);
    }

    public static <T> R<T> fail(IResultCode resultCode, String errorCode, String msg) {
        return new R<>(resultCode, null, errorCode, msg);
    }

    public static <T> R<T> status(boolean flag) {
        return flag ? success("") : fail("操作失败");
    }

}
