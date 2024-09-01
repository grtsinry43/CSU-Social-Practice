package com.grtsinry43.csu.socialpractice.constant;

/**
 * 用户常量
 *
 * @author grtsinry43
 * @date 2024/9/1 16:04
 */
public interface UserConstant {

    /**
     * 用户登录态键
     */
    String USER_LOGIN_STATE = "user_login";

    //  region 权限

    /**
     * 默认角色
     */
    String DEFAULT_ROLE = "user";

    /**
     * 队员角色
     */
    String MEMBER_ROLE = "member";

    /**
     * 队长角色
     */
    String LEADER_ROLE = "leader";

    /**
     * 指导老师角色
     */
    String TEACHER_ROLE = "teacher";

    /**
     * 管理员角色
     */
    String ADMIN_ROLE = "admin";

    /**
     * 被封号
     */
    String BAN_ROLE = "ban";

    // endregion
}
