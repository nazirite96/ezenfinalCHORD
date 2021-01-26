package com.ezen.chord.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.dao.MemberDAO;
import com.ezen.chord.dto.Member;

@Repository
//* @Repository : persistence layer(영속성을 가지는 [파일, db등]) stereotype */
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Member> getMember() throws Exception {
		List<Member> result = new ArrayList<Member>();
		result = sqlSession.selectList("memberMapper.selectMember");
		return result;
	}

}
