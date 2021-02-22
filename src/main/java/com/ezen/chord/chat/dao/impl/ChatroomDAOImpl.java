package com.ezen.chord.chat.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ezen.chord.chat.dao.ChatroomDAO;
import com.ezen.chord.chat.dto.Chatroom;

@Repository
public class ChatroomDAOImpl implements ChatroomDAO {

   @Autowired
   SqlSessionTemplate sqlSessionTemplate;

   @Override
   public int createChatroom(Chatroom input) throws Exception {
      int result = 0;
      result = sqlSessionTemplate.insert("chatroomSql.insertChatroom", input);
      if (result != 0) {
         result = input.getChatroom_no();
      }
      return result;
   }
}