package cn.sixmillions.blog.common.handler;

import cn.sixmillions.blog.common.api.R;
import cn.sixmillions.blog.common.api.ResultCode;
import cn.sixmillions.blog.common.exception.BizException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 统一异常处理
 * ControllerAdvice 当异常抛到controller层时会拦截下来
 * RestControllerAdvice 返回json格式
 *
 * @author six
 * @date 2024/01/26
 */
@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    /**
     * 使用ExceptionHandler注解声明处理TestException异常
     */
    @ExceptionHandler(BizException.class)
    public R bizException(BizException e) {
        log.error("【业务异常】", e);
        return R.fail(ResultCode.FAILURE, e.getErrorCode(), e.getMessage());
    }


    /**
     * 使用ExceptionHandler注解声明处理Exception异常
     */
    @ExceptionHandler(Exception.class)
    public R exception(Exception e) {
        log.error("【系统异常】", e);
        return R.fail(ResultCode.INTERNAL_SERVER_ERROR);
    }

}
