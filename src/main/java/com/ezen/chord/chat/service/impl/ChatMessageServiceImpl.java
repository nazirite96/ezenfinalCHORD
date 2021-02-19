package com.ezen.chord.chat.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.chat.dao.ChatMessageDAO;
import com.ezen.chord.chat.dto.ChatInfo;
import com.ezen.chord.chat.dto.ChatMessage;
import com.ezen.chord.chat.service.ChatMessageService;
import com.ezen.chord.member.dto.MemberDTO;

@Service
public class ChatMessageServiceImpl implements ChatMessageService {

	@Autowired
	ChatMessageDAO chatMessageDAO;

	// Private Chat List 생성
	@Override
	public List<ChatMessage> getPrivateChatList(MemberDTO input) throws Exception {
		return chatMessageDAO.getPrivateChatListInfo(input);
	}

	// ** [temporary code- Additional part] ***//
	// 단체 채팅방 불러오기
	@Override
	public List<ChatMessage> getPubChatroomList(int input) throws Exception {
		return chatMessageDAO.getPubChatroomList(input);
	}

	// 해당 채팅방의 메세지 가져오기 in chatroom.jsp
	@Override
	public List<ChatMessage> getChatMessage(ChatInfo input) throws Exception {
		return chatMessageDAO.getChatMessage(input);
	}

	// 해당 채팅방의 메시지 DB에 insert
	@Override
	public void setChatMessage(ChatMessage input) throws Exception {
		chatMessageDAO.setChatMessage(input);
	}

	// 선택한 메세지 삭제 처리 (한 개씩 update)
	@Override
	public int deleteChatMessage(int input) throws Exception {
		return chatMessageDAO.deleteChatMessage(input);
	}
}