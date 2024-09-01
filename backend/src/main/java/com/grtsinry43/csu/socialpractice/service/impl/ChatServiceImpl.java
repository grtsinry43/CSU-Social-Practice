package com.grtsinry43.csu.socialpractice.service.impl;

import com.grtsinry43.csu.socialpractice.entity.Chat;
import com.grtsinry43.csu.socialpractice.mapper.ChatMapper;
import com.grtsinry43.csu.socialpractice.service.IChatService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 聊天记录 服务实现类
 * </p>
 *
 * @author grtsinry43
 * @since 2024-09-01
 */
@Service
public class ChatServiceImpl extends ServiceImpl<ChatMapper, Chat> implements IChatService {

}
