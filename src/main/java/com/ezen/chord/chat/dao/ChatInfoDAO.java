package com.ezen.chord.chat.dao;

import java.util.List;
import java.util.Map;

import com.ezen.chord.chat.dto.ChatInfo;
import com.ezen.chord.member.dto.MemberDTO;

public interface ChatInfoDAO {

	public int checkChatroom(Map<String, Integer> map);

	public void setChatInfo(List<ChatInfo> input) throws Exception;

	public List<MemberDTO> getChatMemberList(int input) throws Exception;

	public ChatInfo getChatInfo(ChatInfo input) throws Exception;

	public int allDeleteChatMessage(ChatInfo input) throws Exception;

	public void setChatInfo_outtime(ChatInfo input) throws Exception;

	public List<MemberDTO> getInvitationMemberList(MemberDTO input);
}