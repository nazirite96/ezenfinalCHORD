package com.ezen.chord.chat.service;

import java.util.List;

import com.ezen.chord.chat.dto.ChatInfo;
import com.ezen.chord.chat.dto.ChatMessage;
import com.ezen.chord.member.dto.MemberDTO;

public interface ChatMessageService {

   
   public List<ChatMessage> getPrivateChatList(MemberDTO member) throws Exception;

  
   public List<ChatMessage> getChatMessage(ChatInfo input) throws Exception;

 
   public void setChatMessage(ChatMessage input) throws Exception;

   
   public int deleteChatMessage(int input) throws Exception;
}