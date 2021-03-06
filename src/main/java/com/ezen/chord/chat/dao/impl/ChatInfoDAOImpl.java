package com.ezen.chord.chat.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ezen.chord.chat.dao.ChatInfoDAO;
import com.ezen.chord.chat.dto.ChatInfo;
import com.ezen.chord.member.dto.MemberDTO;

@Repository
public class ChatInfoDAOImpl implements ChatInfoDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int checkChatroom(Map<String, Integer> map) {
		Integer temp = null;
		int result = 0;
		temp = sqlSessionTemplate.selectOne("chatInfoSql.selectChatroom", map);
		if (temp == null) {
			result = 0;
		} else {
			result = temp;
		}
		return result;
	}

	@Override
	public void setChatInfo(List<ChatInfo> input) throws Exception {
		int result = 0;
		sqlSessionTemplate.selectList("chatInfoSql.insertChatInfo", input);
		if (result == 0) {
			new NullPointerException("result == 0");
		}
	}

	@Override
	public List<MemberDTO> getChatMemberList(int input) throws Exception {
		List<MemberDTO> result = null;
		result = sqlSessionTemplate.selectList("chatInfoSql.selectChatMemberList", input);
		return result;
	}

	@Override
	public ChatInfo getChatInfo(ChatInfo input) throws Exception {
		ChatInfo result = null;
		result = sqlSessionTemplate.selectOne("chatInfoSql.selectMyChatInfo", input);
		return result;
	}

	@Override
	public int allDeleteChatMessage(ChatInfo input) throws Exception {
		int result = 0;
		result = sqlSessionTemplate.update("chatInfoSql.updateIntime", input);
		if (result == 0) {
			new NullPointerException("result == 0");
		}
		return result;
	}

	@Override
	public void setChatInfo_outtime(ChatInfo input) throws Exception {
		int result = 0;
		result = sqlSessionTemplate.update("chatInfoSql.updateOuttime", input);
		if (result == 0) {
			new NullPointerException("result == 0");
		}
	}

	@Override
	public List<MemberDTO> getInvitationMemberList(MemberDTO input) {
		List<MemberDTO> result = null;
		result = sqlSessionTemplate.selectList("chatInfoSql.selectInvitationMemberList", input);
		return result;
	}
}