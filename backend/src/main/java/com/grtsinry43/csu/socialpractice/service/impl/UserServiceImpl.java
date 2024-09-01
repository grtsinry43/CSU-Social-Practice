package com.grtsinry43.csu.socialpractice.service.impl;

import com.grtsinry43.csu.socialpractice.entity.User;
import com.grtsinry43.csu.socialpractice.mapper.UserMapper;
import com.grtsinry43.csu.socialpractice.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户 服务实现类
 * </p>
 *
 * @author grtsinry43
 * @since 2024-09-01
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

}
