package com.grtsinry43.csu.socialpractice.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 团队打卡设置
 * </p>
 *
 * @author grtsinry43
 * @since 2024-09-01
 */
@Getter
@Setter
@TableName("team_checkin")
public class TeamCheckin implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 团队 id
     */
    private Long teamId;

    /**
     * 打卡开始时间
     */
    private LocalDateTime startTime;

    /**
     * 打卡截止时间
     */
    private LocalDateTime endTime;

    /**
     * 是否需要定位
     */
    private Boolean needLocation;

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
}
