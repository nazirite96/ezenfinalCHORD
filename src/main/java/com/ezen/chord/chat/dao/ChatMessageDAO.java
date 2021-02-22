package com.ezen.chord.chat.dao;

import java.util.List;
import com.ezen.chord.chat.dto.ChatInfo;
import com.ezen.chord.chat.dto.ChatMessage;
import com.ezen.chord.member.dto.MemberDTO;

public interface ChatMessageDAO {

	public List<ChatMessage> getPrivateChatListInfo(MemberDTO input) throws Exception;

	public List<ChatMessage> getPubChatroomList(int input) throws Exception;

	public List<ChatMessage> getChatMessage(ChatInfo input) throws Exception;

	public void setChatMessage(ChatMessage input) throws Exception;

	public int deleteChatMessage(int input) throws Exception;
}