package cn.sixmillions.blog.service.impl;

import cn.sixmillions.blog.entity.Post;
import cn.sixmillions.blog.mapper.PostMapper;
import cn.sixmillions.blog.service.IPostService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author six
 * @date 2024/01/26
 */
@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements IPostService {

}
