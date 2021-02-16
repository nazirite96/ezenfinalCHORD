package com.ezen.chord.chat.service;

import java.util.List;

import com.ezen.chord.chat.dto.ChatInfo;
import com.ezen.chord.chat.dto.ChatMessage;
import com.ezen.chord.member.dto.MemberDTO;

public interface ChatMessageService {

   // Private Chat List 생성
   public List<ChatMessage> getPrivateChatList(MemberDTO member) throws Exception;

   // 해당 채팅방의 메세지 가져오기 in chatroom.jsp
   public List<ChatMessage> getChatMessage(ChatInfo input) throws Exception;

   // 해당 채팅방의 메시지 DB에 insert
   public void setChatMessage(ChatMessage input) throws Exception;

   // 선택한 메세지 삭제 처리 (한 개씩 update)
   public int deleteChatMessage(int input) throws Exception;
}