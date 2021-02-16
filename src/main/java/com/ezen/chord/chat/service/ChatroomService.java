package com.ezen.chord.chat.service;

import com.ezen.chord.chat.dto.Chatroom;

public interface ChatroomService {
   
   // 채팅방 생성
   public int createChatroom(Chatroom input) throws Exception;
}