package cn.sixmillions.blog.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author six
 * @date 2024/01/26
 */
@Configuration
@MapperScan("cn.sixmillions.blog.mapper")
public class MyBatisPlusConfig {
    
}
