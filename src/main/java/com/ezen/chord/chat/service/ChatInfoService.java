package com.ezen.chord.chat.service;

import java.util.List;

import com.ezen.chord.chat.dto.ChatInfo;
import com.ezen.chord.member.dto.MemberDTO;

public interface ChatInfoService {

	public int checkChatroom(int input1, int input2) throws Exception;
	public void setChatInfo(List<ChatInfo> input) throws Exception;
	public List<MemberDTO> getChatMemberList(int input) throws Exception;
	public ChatInfo getChatInfo(ChatInfo input) throws Exception;
	public int allDeleteChatMessage(ChatInfo input) throws Exception;
	public void setChatInfo_outtime(ChatInfo input) throws Exception;
	public List<MemberDTO> getInvitationMemberList(MemberDTO input) throws Exception;

}