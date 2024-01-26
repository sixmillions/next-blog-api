-- 文章基本信息表
CREATE TABLE tt_post
(
    id               BIGSERIAL PRIMARY KEY,
    title            VARCHAR(1024),
    slug             VARCHAR(250),
    thumbnail        VARCHAR(1024),
    post_summary     VARCHAR(2048),
    status           SMALLINT    DEFAULT 0,
    top_priority     SMALLINT    DEFAULT 0,
    word_count       INT         DEFAULT 0,
    visits           INT         DEFAULT 0,
    likes            INT         DEFAULT 0,
    comments_count   INT         DEFAULT 0,
    post_type        SMALLINT    DEFAULT 0,
    post_format      VARCHAR(20) DEFAULT 'markdown',
    disallow_comment BOOLEAN     DEFAULT FALSE,
    deleted          SMALLINT    DEFAULT 0,
    created_by       VARCHAR(50) DEFAULT 'sys',
    created_at       TIMESTAMP   DEFAULT NOW(),
    update_by        VARCHAR(50) DEFAULT 'sys',
    update_at        TIMESTAMP   DEFAULT NOW()
);
CREATE INDEX tt_post_idx_slug ON tt_post (slug);

-- 注释
COMMENT ON TABLE tt_post IS '文章信息表';
COMMENT ON COLUMN tt_post.id IS '文章信息id：自增、主键';
COMMENT ON COLUMN tt_post.title IS '文章标题';
COMMENT ON COLUMN tt_post.slug IS '文章简短url，唯一标识符';
COMMENT ON COLUMN tt_post.thumbnail IS '文章缩略图/封面';
COMMENT ON COLUMN tt_post.post_summary IS '文章摘要';
COMMENT ON COLUMN tt_post.status IS '文章状态（0：草稿；1：发布）；CODE_GROUP: POST_STATUS';
COMMENT ON COLUMN tt_post.top_priority IS '文章优先级（数字越大，优先级越高）';
COMMENT ON COLUMN tt_post.word_count IS '文章字数';
COMMENT ON COLUMN tt_post.visits IS '文章浏览量';
COMMENT ON COLUMN tt_post.likes IS '文章点赞数';
COMMENT ON COLUMN tt_post.comments_count IS '文章评论数量';
COMMENT ON COLUMN tt_post.post_type IS '文章类型（0：文章；1：memo）';
COMMENT ON COLUMN tt_post.post_format IS '文章格式：默认是markdown';
COMMENT ON COLUMN tt_post.disallow_comment IS '文章不允许评论（true：不允许评论；false：允许评论）';
COMMENT ON COLUMN tt_post.deleted IS '逻辑删除（0 未删除、1 删除）';
COMMENT ON COLUMN tt_post.created_by IS '创建人：默认sys';
COMMENT ON COLUMN tt_post.created_at IS '创建时间：默认当前时间';
COMMENT ON COLUMN tt_post.update_by IS '更新人：默认sys';
COMMENT ON COLUMN tt_post.update_at IS '更新时间：默认当前时间';

-- 初始数据
INSERT INTO tt_post (slug, post_summary, thumbnail, title)
VALUES ('markdown-test', 'markdown语法测试', 'https://s.sixmillions.cn/img/cover/markdown.png', 'Markdown语法测试');

---

--文章内容表
CREATE TABLE tt_content
(
    post_id      bigint NOT NULL unique,
    post_content VARCHAR,
    html_content VARCHAR,
    deleted      SMALLINT    DEFAULT 0,
    created_by   VARCHAR(50) DEFAULT 'sys',
    created_at   TIMESTAMP   DEFAULT NOW(),
    update_by    VARCHAR(50) DEFAULT 'sys',
    update_at    TIMESTAMP   DEFAULT NOW()
);

-- 注释
COMMENT ON TABLE tt_content IS '文章信息表';
COMMENT ON COLUMN tt_content.post_id IS '文章id：取自tt_post表的id';
COMMENT ON COLUMN tt_content.post_content IS '文章内容';
COMMENT ON COLUMN tt_content.html_content IS '文章html内容';
COMMENT ON COLUMN tt_content.deleted IS '逻辑删除（0 未删除、1 删除）';
COMMENT ON COLUMN tt_content.created_by IS '创建人：默认sys';
COMMENT ON COLUMN tt_content.created_at IS '创建时间：默认当前时间';
COMMENT ON COLUMN tt_content.update_by IS '更新人：默认sys';
COMMENT ON COLUMN tt_content.update_at IS '更新时间：默认当前时间';

-- 初始内容
INSERT INTO tt_content (post_id, post_content, html_content)
VALUES (1, '# Hello World', '<h1 id="%E4%B8%80%E7%BA%A7%E6%A0%87%E9%A2%98" tabindex="-1">一级标题</h1>');

---

--标签表
CREATE TABLE tt_tag
(
    id         BIGSERIAL PRIMARY KEY,
    slug       VARCHAR(50) NOT NULL,
    tag_name   VARCHAR(50) NOT NULL,
    thumbnail  VARCHAR(1024),
    icon       VARCHAR(1024),
    deleted    SMALLINT    DEFAULT 0,
    created_by VARCHAR(50) DEFAULT 'sys',
    created_at TIMESTAMP   DEFAULT NOW(),
    update_by  VARCHAR(50) DEFAULT 'sys',
    update_at  TIMESTAMP   DEFAULT NOW()
);

-- 注释
COMMENT ON TABLE tt_tag IS '标签表';
COMMENT ON COLUMN tt_tag.id IS '标签id：自增、主键';
COMMENT ON COLUMN tt_tag.slug IS '标签展示页的地址slug';
COMMENT ON COLUMN tt_tag.tag_name IS '标签名称';
COMMENT ON COLUMN tt_tag.thumbnail IS '封面图片地址';
COMMENT ON COLUMN tt_tag.icon IS '图标';
COMMENT ON COLUMN tt_tag.deleted IS '逻辑删除（0 未删除、1 删除）';
COMMENT ON COLUMN tt_tag.created_by IS '创建人：默认sys';
COMMENT ON COLUMN tt_tag.created_at IS '创建时间：默认当前时间';
COMMENT ON COLUMN tt_tag.update_by IS '更新人：默认sys';
COMMENT ON COLUMN tt_tag.update_at IS '更新时间：默认当前时间';

-- 初始内容
INSERT INTO tt_tag (slug, tag_name)
VALUES ('java', 'Java'),
       ('docker', 'Docker');

---

--文章标签表
CREATE TABLE tr_post_tag
(
    id         BIGSERIAL PRIMARY KEY,
    post_id    BIGINT NOT NULL,
    tag_id     BIGINT NOT NULL,
    deleted    SMALLINT    DEFAULT 0,
    created_by VARCHAR(50) DEFAULT 'sys',
    created_at TIMESTAMP   DEFAULT NOW(),
    update_by  VARCHAR(50) DEFAULT 'sys',
    update_at  TIMESTAMP   DEFAULT NOW()
);

-- 注释
COMMENT ON TABLE tr_post_tag IS '文章和标签的关系表';
COMMENT ON COLUMN tr_post_tag.id IS '关系id：自增、主键';
COMMENT ON COLUMN tr_post_tag.post_id IS '所属文章id：取自tt_post表的id';
COMMENT ON COLUMN tr_post_tag.tag_id IS '标签id：取自tt_tag表的id';
COMMENT ON COLUMN tr_post_tag.deleted IS '逻辑删除（0 未删除、1 删除）';
COMMENT ON COLUMN tr_post_tag.created_by IS '创建人：默认sys';
COMMENT ON COLUMN tr_post_tag.created_at IS '创建时间：默认当前时间';
COMMENT ON COLUMN tr_post_tag.update_by IS '更新人：默认sys';
COMMENT ON COLUMN tr_post_tag.update_at IS '更新时间：默认当前时间';

---

--分类表
CREATE TABLE tt_category
(
    id            BIGSERIAL PRIMARY KEY,
    slug          VARCHAR(50) NOT NULL,
    pid           bigint      DEFAULT 0,
    category_name VARCHAR(50) NOT NULL,
    thumbnail     VARCHAR(1024),
    icon          VARCHAR(1024),
    secret        VARCHAR(1024),
    description   VARCHAR(8192),
    top_priority  SMALLINT    DEFAULT 0,
    deleted       SMALLINT    DEFAULT 0,
    created_by    VARCHAR(50) DEFAULT 'sys',
    created_at    TIMESTAMP   DEFAULT NOW(),
    update_by     VARCHAR(50) DEFAULT 'sys',
    update_at     TIMESTAMP   DEFAULT NOW()
);

-- 注释
COMMENT ON TABLE tt_category IS '分类表';
COMMENT ON COLUMN tt_category.id IS '分类id：自增、主键';
COMMENT ON COLUMN tt_category.slug IS '分类展示页的地址slug';
COMMENT ON COLUMN tt_category.pid IS '分类父级id';
COMMENT ON COLUMN tt_category.category_name IS '分类名称';
COMMENT ON COLUMN tt_category.thumbnail IS '封面图片地址';
COMMENT ON COLUMN tt_category.icon IS '图标';
COMMENT ON COLUMN tt_category.secret IS '密钥';
COMMENT ON COLUMN tt_category.description IS '分类描述';
COMMENT ON COLUMN tt_post.top_priority IS '文章优先级（数字越大，优先级越高）';
COMMENT ON COLUMN tt_category.deleted IS '逻辑删除（0 未删除、1 删除）';
COMMENT ON COLUMN tt_category.created_by IS '创建人：默认sys';
COMMENT ON COLUMN tt_category.created_at IS '创建时间：默认当前时间';
COMMENT ON COLUMN tt_category.update_by IS '更新人：默认sys';
COMMENT ON COLUMN tt_category.update_at IS '更新时间：默认当前时间';

-- 初始内容
INSERT INTO tt_category (slug, category_name)
VALUES ('tool', '工具'),
       ('springboot', 'Spring Boot');

---

--文章分类表
CREATE TABLE tr_post_category
(
    id          BIGSERIAL PRIMARY KEY,
    user_id     BIGINT NOT NULL,
    post_id     BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    deleted     SMALLINT    DEFAULT 0,
    created_by  VARCHAR(50) DEFAULT 'sys',
    created_at  TIMESTAMP   DEFAULT NOW(),
    update_by   VARCHAR(50) DEFAULT 'sys',
    update_at   TIMESTAMP   DEFAULT NOW()
);

-- 注释
COMMENT ON TABLE tr_post_category IS '文章和分类的关系表';
COMMENT ON COLUMN tr_post_category.id IS '关系id：自增、主键';
COMMENT ON COLUMN tr_post_category.post_id IS '所属文章id：取自tt_post表的id';
COMMENT ON COLUMN tr_post_category.user_id IS '所属用户id：取自tm_user表的id';
COMMENT ON COLUMN tr_post_category.category_id IS '分类id：取自tt_tag表的id';
COMMENT ON COLUMN tr_post_category.deleted IS '逻辑删除（0 未删除、1 删除）';
COMMENT ON COLUMN tr_post_category.created_by IS '创建人：默认sys';
COMMENT ON COLUMN tr_post_category.created_at IS '创建时间：默认当前时间';
COMMENT ON COLUMN tr_post_category.update_by IS '更新人：默认sys';
COMMENT ON COLUMN tr_post_category.update_at IS '更新时间：默认当前时间';