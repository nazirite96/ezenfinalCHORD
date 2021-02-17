package com.ezen.chord.chat.dao;

import java.util.List;
import java.util.Map;

import com.ezen.chord.chat.dto.Chatroom;

public interface ChatroomDAO {

	// 채팅방 생성
	public int createChatroom(Chatroom input) throws Exception;
	
	// ** [temporary code- Additional part] ***//
	// 단체 채팅방 불러오기
	public List<Map<String, Object>> getPubChatroomList(int input) throws Exception;
}