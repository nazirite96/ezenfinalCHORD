package com.ezen.chord.chat.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ezen.chord.chat.dao.ChatroomDAO;
import com.ezen.chord.chat.dto.Chatroom;
import com.ezen.chord.chat.service.ChatroomService;

@Service
public class ChatroomServiceImpl implements ChatroomService {

   @Autowired
   ChatroomDAO chatroomDAO;

   // 채팅방 생성
   @Override
   public int createChatroom(Chatroom input) throws Exception {
      return chatroomDAO.createChatroom(input);
   }
}