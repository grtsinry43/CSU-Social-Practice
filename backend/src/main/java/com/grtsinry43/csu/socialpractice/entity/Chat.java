package com.grtsinry43.csu.socialpractice.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 聊天记录
 * </p>
 *
 * @author grtsinry43
 * @since 2024-09-01
 */
@Getter
@Setter
public class Chat implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 发送者 id
     */
    private Long senderId;

    /**
     * 接收者 id (私聊时使用)
     */
    private Long receiverId;

    /**
     * 群组 id (群聊时使用)
     */
    private Long groupId;

    /**
     * 消息内容
     */
    private String content;

    /**
     * 图片 URL
     */
    private String imageUrl;

    /**
     * 音频 URL
     */
    private String audioUrl;

    /**
     * 消息类型
     */
    private String messageType;

    /**
     * 聊天类型
     */
    private String chatType;

    /**
     * 引用的消息 id
     */
    private Long referenceId;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    /**
     * 是否删除
     */
    private Boolean isDeleted;

    /**
     * 是否撤回
     */
    private Boolean isWithdrawn;
}
