package com.ezen.chord.chat.service;

import java.util.List;

import com.ezen.chord.chat.dto.ChatInfo;
import com.ezen.chord.member.dto.MemberDTO;

public interface ChatInfoService {

	// 채팅방 존재 여부 확인
	public int checkChatroom(int input1, int input2) throws Exception;

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

	// ** [temporary code- Additional part] ***//
	// 채팅방 생성을 위한 같은 회사 멤버 조회
	public List<MemberDTO> getInvitationMemberList(MemberDTO input) throws Exception;

}