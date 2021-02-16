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

	// 채팅방 존재 여부 확인
	@Override
	public int checkChatroom(int input1, int input2) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("myMem_no", input1);
		map.put("yourMem_no", input2);
		return chatInfoDAO.checkChatroom(map);
	}

	// 채팅방 생성 후 chatInfo Insert
	@Override
	public void setChatInfo(List<ChatInfo> input) throws Exception {
		chatInfoDAO.setChatInfo(input);
	}

	// 채팅방 참여 회원 리스트 in chatroom.jsp
	@Override
	public List<MemberDTO> getChatMemberList(int input) throws Exception {
		return chatInfoDAO.getChatMemberList(input);
	}

	// 채팅방 정보 불러오기
	@Override
	public ChatInfo getChatInfo(ChatInfo input) throws Exception {
		return chatInfoDAO.getChatInfo(input);
	}

	// 나의 채팅방 메시지 전체 삭제(intime update) in chatroom.jsp
	@Override
	public int allDeleteChatMessage(ChatInfo input) throws Exception {
		return chatInfoDAO.allDeleteChatMessage(input);
	}

	// 채팅방 종료시간 변경 in chatroom.jsp
	@Override
	public void setChatInfo_outtime(ChatInfo input) throws Exception {
		chatInfoDAO.setChatInfo_outtime(input);
	}

}