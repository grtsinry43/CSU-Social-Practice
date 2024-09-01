package com.grtsinry43.csu.socialpractice.service.impl;

import com.grtsinry43.csu.socialpractice.entity.Post;
import com.grtsinry43.csu.socialpractice.mapper.PostMapper;
import com.grtsinry43.csu.socialpractice.service.IPostService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 帖子 服务实现类
 * </p>
 *
 * @author grtsinry43
 * @since 2024-09-01
 */
@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements IPostService {

}
