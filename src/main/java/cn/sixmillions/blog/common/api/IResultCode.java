package cn.sixmillions.blog.common.api;


import java.io.Serializable;

/**
 * 统一返回接口
 *
 * @author six
 * @date 2024/01/26
 */
public interface IResultCode extends Serializable {

    int getCode();

    String getMessage();

}
