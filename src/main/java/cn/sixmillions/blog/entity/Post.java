package cn.sixmillions.blog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 文章信息表(Post)实体类
 *
 * @author six
 * @date 2024/01/26
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@TableName("tt_post")
public class Post implements Serializable {

    @Serial
    private static final long serialVersionUID = 188363249141865992L;
    /**
     * 文章信息id：自增、主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 文章标题
     */
    private String title;
    /**
     * 文章简短url，唯一标识符
     */
    private String slug;
    /**
     * 文章缩略图/封面
     */
    private String thumbnail;
    /**
     * 文章摘要
     */
    private String postSummary;
    /**
     * 文章状态（0：草稿；1：发布）；CODE_GROUP: POST_STATUS
     */
    private Integer status;
    /**
     * 文章优先级（数字越大，优先级越高）
     */
    private Integer topPriority;
    /**
     * 文章字数
     */
    private Integer wordCount;
    /**
     * 文章浏览量
     */
    private Integer visits;
    /**
     * 文章点赞数
     */
    private Integer likes;
    /**
     * 文章评论数量
     */
    private Integer commentsCount;
    /**
     * 文章类型（0：文章；1：memo）
     */
    private Integer postType;
    /**
     * 文章格式：默认是markdown
     */
    private String postFormat;
    /**
     * 文章不允许评论（true：不允许评论；false：允许评论）
     */
    private Boolean disallowComment;
    /**
     * 逻辑删除（0 未删除、1 删除）
     */
    private Integer deleted;
    /**
     * 创建人：默认sys
     */
    private String createdBy;
    /**
     * 创建时间：默认当前时间
     */
    private LocalDateTime createdAt;
    /**
     * 更新人：默认sys
     */
    private String updateBy;
    /**
     * 更新时间：默认当前时间
     */
    private LocalDateTime updateAt;

}

