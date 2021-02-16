package com.ezen.chord.chat.dao;

import java.util.List;
import java.util.Map;

import com.ezen.chord.chat.dto.ChatInfo;
import com.ezen.chord.member.dto.MemberDTO;

public interface ChatInfoDAO {
	// 채팅방 존재 여부 확인
	public int checkChatroom(Map<String, Integer> map);

	// 채팅방 생성 후 chatInfo Insert
	public void setChatInfo(List<ChatInfo> input) throws Exception;

	// 채팅방 참여 회원 리스트 in chatroom.jsp
	public List<MemberDTO> getChatMemberList(int input) throws Exception;

	// 채팅방 정보 불러오기
	public ChatInfo getChatInfo(ChatInfo input) throws Exception;

	// 나의 채팅방 메시지 전체 삭제(intime update) in chatroom.jsp
	public int allDeleteChatMessage(ChatInfo input) throws Exception;

	// 채팅방 종료시간 변경 in chatroom.jsp
	public void setChatInfo_outtime(ChatInfo input) throws Exception;
}