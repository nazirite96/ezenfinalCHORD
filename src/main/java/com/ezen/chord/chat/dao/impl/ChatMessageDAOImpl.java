package com.ezen.chord.chat.dao.impl;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.chat.dao.ChatMessageDAO;
import com.ezen.chord.chat.dto.ChatInfo;
import com.ezen.chord.chat.dto.ChatMessage;
import com.ezen.chord.member.dto.MemberDTO;

@Repository
public class ChatMessageDAOImpl implements ChatMessageDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ChatMessage> getPrivateChatListInfo(MemberDTO input) throws Exception {
		List<ChatMessage> result = null;
		result = sqlSessionTemplate.selectList("chatMessageSql.selectPrivateChatList", input);
		return result;
	}

	@Override
	public List<ChatMessage> getPubChatroomList(int input) throws Exception {
		List<ChatMessage> result = null;
		result = sqlSessionTemplate.selectList("chatMessageSql.selectPubChatroomList", input);
		return result;
	}

	@Override
	public List<ChatMessage> getChatMessage(ChatInfo input) throws Exception {
		List<ChatMessage> result = null;
		result = sqlSessionTemplate.selectList("chatMessageSql.selectChatroomMessage", input);
		return result;
	}

	@Override
	public void setChatMessage(ChatMessage input) throws Exception {
		int result = 0;
		result = sqlSessionTemplate.insert("chatMessageSql.insertChatMessage", input);
		if (result == 0) {
			new NullPointerException("result == 0");
		}
	}

	@Override
	public int deleteChatMessage(int input) throws Exception {
		int result = 0;
		result = sqlSessionTemplate.update("chatMessageSql.updateChatMessage", input);
		if (result == 0) {
			new NullPointerException("result == 0");
		}
		return result;
	}
}