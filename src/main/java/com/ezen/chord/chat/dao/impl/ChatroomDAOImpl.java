package com.ezen.chord.chat.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ezen.chord.chat.dao.ChatroomDAO;
import com.ezen.chord.chat.dto.Chatroom;

@Repository
public class ChatroomDAOImpl implements ChatroomDAO {

   @Autowired
   SqlSessionTemplate sqlSessionTemplate;

   // 채팅방 생성
   @Override
   public int createChatroom(Chatroom input) throws Exception {
      int result = 0;
      result = sqlSessionTemplate.insert("chatroomSql.insertChatroom", input);
      if (result != 0) {
         result = input.getChatroom_no();
      }
      return result;
   }
   // ** [temporary code- Additional part] ***//
   // 단체 채팅방 불러오기
   @Override
   public List<Map<String, Object>> getPubChatroomList(int input) throws Exception {
	   List<Map<String, Object>> result = null;
	   result = sqlSessionTemplate.selectList("chatroomSql.selectPubChatroomList", input);
	   return result;
   }
}