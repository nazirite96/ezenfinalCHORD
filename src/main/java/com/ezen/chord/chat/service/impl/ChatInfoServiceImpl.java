package com.ezen.chord.chat.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ezen.chord.chat.dao.ChatInfoDAO;
import com.ezen.chord.chat.dto.ChatInfo;
import com.ezen.chord.chat.service.ChatInfoService;
import com.ezen.chord.member.dto.MemberDTO;

@Service
public class ChatInfoServiceImpl implements ChatInfoService {

	@Autowired
	ChatInfoDAO chatInfoDAO;

	@Override
	public int checkChatroom(int input1, int input2) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("myMem_no", input1);
		map.put("yourMem_no", input2);
		return chatInfoDAO.checkChatroom(map);
	}

	@Override
	public void setChatInfo(List<ChatInfo> input) throws Exception {
		chatInfoDAO.setChatInfo(input);
	}

	@Override
	public List<MemberDTO> getChatMemberList(int input) throws Exception {
		return chatInfoDAO.getChatMemberList(input);
	}

	@Override
	public ChatInfo getChatInfo(ChatInfo input) throws Exception {
		return chatInfoDAO.getChatInfo(input);
	}

	@Override
	public int allDeleteChatMessage(ChatInfo input) throws Exception {
		return chatInfoDAO.allDeleteChatMessage(input);
	}

	@Override
	public void setChatInfo_outtime(ChatInfo input) throws Exception {
		chatInfoDAO.setChatInfo_outtime(input);
	}

	@Override
	public List<MemberDTO> getInvitationMemberList(MemberDTO input) throws Exception {
		return chatInfoDAO.getInvitationMemberList(input);
	}
}