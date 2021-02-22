package com.ezen.chord.chat.dao;

import com.ezen.chord.chat.dto.Chatroom;

public interface ChatroomDAO {
	public int createChatroom(Chatroom input) throws Exception;
}