-- 创建团队表
CREATE TABLE IF NOT EXISTS team
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    teamName   VARCHAR(256)                         NOT NULL COMMENT '团队名称',
    createTime DATETIME   DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    updateTime DATETIME   DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    isDeleted  TINYINT(1) DEFAULT 0                 NOT NULL COMMENT '是否删除'
) COMMENT '团队' COLLATE = utf8mb4_unicode_ci;

-- 用户表
CREATE TABLE IF NOT EXISTS user
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    userPhone    VARCHAR(20)                                                                     NOT NULL COMMENT '手机号',
    userPassword VARCHAR(512)                                                                    NOT NULL COMMENT '密码',
    unionId      VARCHAR(256)                                                                    NULL COMMENT '微信开放平台id',
    mpOpenId     VARCHAR(256)                                                                    NULL COMMENT '公众号openId',
    userName     VARCHAR(256)                                                                    NULL COMMENT '用户昵称',
    userAvatar   VARCHAR(1024)                                                                   NULL COMMENT '用户头像',
    userProfile  VARCHAR(512)                                                                    NULL COMMENT '用户简介',
    userRole     ENUM ('user', 'admin', 'leader', 'teacher', 'member') DEFAULT 'user'            NOT NULL COMMENT '用户角色',
    ipLocation   VARCHAR(256)                                          DEFAULT '未知'            NULL COMMENT 'IP属地',
    createTime   DATETIME                                              DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    updateTime   DATETIME                                              DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    isDeleted    TINYINT(1)                                            DEFAULT 0                 NOT NULL COMMENT '是否删除',
    INDEX idx_unionId (unionId)
) COMMENT '用户' COLLATE = utf8mb4_unicode_ci;

-- 用户团队关系表（一个人可以加入多个团队）
CREATE TABLE IF NOT EXISTS user_team
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    userId     BIGINT                               NOT NULL COMMENT '用户 id',
    teamId     BIGINT                               NOT NULL COMMENT '团队 id',
    createTime DATETIME   DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    updateTime DATETIME   DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    isDeleted  TINYINT(1) DEFAULT 0                 NOT NULL COMMENT '是否删除',
    INDEX idx_user_team (userId, teamId),
    CONSTRAINT fk_user_team_user FOREIGN KEY (userId) REFERENCES user (id),
    CONSTRAINT fk_user_team_team FOREIGN KEY (teamId) REFERENCES team (id)
) COMMENT '用户团队关系' COLLATE = utf8mb4_unicode_ci;

-- 帖子表
CREATE TABLE IF NOT EXISTS post
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    title      VARCHAR(512)                                                           NULL COMMENT '标题',
    content    TEXT                                                                   NULL COMMENT '内容',
    tags       VARCHAR(1024)                                                          NULL COMMENT '标签列表（json 数组）',
    thumbNum   INT                                          DEFAULT 0                 NOT NULL COMMENT '点赞数',
    favourNum  INT                                          DEFAULT 0                 NOT NULL COMMENT '收藏数',
    userId     BIGINT                                                                 NOT NULL COMMENT '创建用户 id',
    visibility ENUM ('all', 'team', 'team_members', 'self') DEFAULT 'all'             NOT NULL COMMENT '可见范围',
    ipLocation VARCHAR(256)                                 DEFAULT '未知'            NULL COMMENT 'IP属地',
    createTime DATETIME                                     DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    updateTime DATETIME                                     DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    isDeleted  TINYINT(1)                                   DEFAULT 0                 NOT NULL COMMENT '是否删除',
    INDEX idx_userId (userId)
) COMMENT '帖子' COLLATE = utf8mb4_unicode_ci;

-- 帖子点赞表（硬删除）
CREATE TABLE IF NOT EXISTS post_thumb
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    postId     BIGINT                             NOT NULL COMMENT '帖子 id',
    userId     BIGINT                             NOT NULL COMMENT '创建用户 id',
    createTime DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    updateTime DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX idx_post_user (postId, userId)
) COMMENT '帖子点赞';

-- 帖子收藏表（硬删除）
CREATE TABLE IF NOT EXISTS post_favour
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    postId     BIGINT                             NOT NULL COMMENT '帖子 id',
    userId     BIGINT                             NOT NULL COMMENT '创建用户 id',
    createTime DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    updateTime DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX idx_post_user (postId, userId)
) COMMENT '帖子收藏';

-- 评论表
CREATE TABLE IF NOT EXISTS comment
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    postId     BIGINT                                 NOT NULL COMMENT '帖子 id',
    userId     BIGINT                                 NOT NULL COMMENT '评论用户 id',
    content    TEXT                                   NOT NULL COMMENT '评论内容',
    thumbNum   INT          DEFAULT 0                 NOT NULL COMMENT '点赞数',
    parentId   BIGINT                                 NULL COMMENT '父评论 id',
    ipLocation VARCHAR(256) DEFAULT '未知'            NULL COMMENT 'IP属地',
    createTime DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    updateTime DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    isDeleted  TINYINT(1)   DEFAULT 0                 NOT NULL COMMENT '是否删除',
    INDEX idx_post_user (postId, userId),
    INDEX idx_parentId (parentId)
) COMMENT '评论' COLLATE = utf8mb4_unicode_ci;

-- 评论点赞表（硬删除）
CREATE TABLE IF NOT EXISTS comment_thumb
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    commentId  BIGINT                             NOT NULL COMMENT '评论 id',
    userId     BIGINT                             NOT NULL COMMENT '点赞用户 id',
    createTime DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    updateTime DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX idx_comment_user (commentId, userId)
) COMMENT '评论点赞' COLLATE = utf8mb4_unicode_ci;

-- 聊天记录表
CREATE TABLE IF NOT EXISTS chat
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    senderId    BIGINT                                                    NOT NULL COMMENT '发送者 id',
    receiverId  BIGINT                                                    NULL COMMENT '接收者 id (私聊时使用)',
    groupId     BIGINT                                                    NULL COMMENT '群组 id (群聊时使用)',
    content     TEXT                                                      NULL COMMENT '消息内容',
    imageUrl    VARCHAR(1024)                                             NULL COMMENT '图片 URL',
    audioUrl    VARCHAR(1024)                                             NULL COMMENT '音频 URL',
    messageType ENUM ('text', 'image', 'audio') DEFAULT 'text'            NOT NULL COMMENT '消息类型',
    chatType    ENUM ('private', 'group')       DEFAULT 'private'         NOT NULL COMMENT '聊天类型',
    referenceId BIGINT                                                    NULL COMMENT '引用的消息 id',
    createTime  DATETIME                        DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    updateTime  DATETIME                        DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    isDeleted   TINYINT(1)                      DEFAULT 0                 NOT NULL COMMENT '是否删除',
    isWithdrawn TINYINT(1)                      DEFAULT 0                 NOT NULL COMMENT '是否撤回',
    INDEX idx_sender_receiver (senderId, receiverId),
    INDEX idx_groupId (groupId),
    INDEX idx_referenceId (referenceId)
) COMMENT '聊天记录' COLLATE = utf8mb4_unicode_ci;

-- 团队打卡设置表
CREATE TABLE IF NOT EXISTS team_checkin
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    teamId       BIGINT                               NOT NULL COMMENT '团队 id',
    startTime    DATETIME                             NOT NULL COMMENT '打卡开始时间',
    endTime      DATETIME                             NOT NULL COMMENT '打卡截止时间',
    needLocation TINYINT(1)                           NOT NULL COMMENT '是否需要定位',
    createTime   DATETIME   DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    updateTime   DATETIME   DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    isDeleted    TINYINT(1) DEFAULT 0                 NOT NULL COMMENT '是否删除',
    INDEX idx_teamId (teamId),
    CONSTRAINT fk_team_checkin FOREIGN KEY (teamId) REFERENCES team (id)
) COMMENT '团队打卡设置' COLLATE = utf8mb4_unicode_ci;

-- 打卡记录表
CREATE TABLE IF NOT EXISTS checkin_record
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    userId      BIGINT                               NOT NULL COMMENT '用户 id',
    teamId      BIGINT                               NOT NULL COMMENT '团队 id',
    checkinTime DATETIME                             NOT NULL COMMENT '打卡时间',
    createTime  DATETIME   DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
    updateTime  DATETIME   DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    isDeleted   TINYINT(1) DEFAULT 0                 NOT NULL COMMENT '是否删除',
    INDEX idx_user_team (userId, teamId),
    CONSTRAINT fk_user_checkin FOREIGN KEY (userId) REFERENCES user (id),
    CONSTRAINT fk_team_checkin_record FOREIGN KEY (teamId) REFERENCES team (id)
) COMMENT '打卡记录' COLLATE = utf8mb4_unicode_ci;
