package cn.sixmillions.blog.common.exception;

import cn.sixmillions.blog.common.api.IErrorCode;
import lombok.Getter;

/**
 * 自定义异常
 *
 * @author six
 * @date 2024/01/26
 */
@Getter
public class BizException extends RuntimeException {

    /**
     * 错误码
     */
    private String errorCode;

    public BizException(IErrorCode errorCode) {
        // 调用父类的方法添加信息
        super(errorCode.getMessage());
        this.errorCode = errorCode.getErrorCode();
    }

}
