package com.ezen.chord.chat.service.impl;

import java.util.List;
import java.util.Map;

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
   
   // ** [temporary code- Additional part] ***//
   // 단체 채팅방 불러오기
   @Override
   public List<Map<String, Object>> getPubChatroomList(int input) throws Exception {
	   List<Map<String, Object>> result = null;
		result = chatroomDAO.getPubChatroomList(input);
		if (result == null) {
			new NullPointerException("result == null");
		}
		return result;
   }
}