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

	@Override
	public List<ChatMessage> getPrivateChatList(MemberDTO input) throws Exception {
		return chatMessageDAO.getPrivateChatListInfo(input);
	}

	@Override
	public List<ChatMessage> getPubChatroomList(int input) throws Exception {
		return chatMessageDAO.getPubChatroomList(input);
	}

	@Override
	public List<ChatMessage> getChatMessage(ChatInfo input) throws Exception {
		return chatMessageDAO.getChatMessage(input);
	}

	@Override
	public void setChatMessage(ChatMessage input) throws Exception {
		chatMessageDAO.setChatMessage(input);
	}

	@Override
	public int deleteChatMessage(int input) throws Exception {
		return chatMessageDAO.deleteChatMessage(input);
	}
}