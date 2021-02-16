package com.ezen.chord.chat.dao;

import com.ezen.chord.chat.dto.Chatroom;

public interface ChatroomDAO {

	// 채팅방 생성
	public int createChatroom(Chatroom input) throws Exception;
}