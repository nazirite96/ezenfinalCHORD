package com.ezen.chord.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.dao.MemberDAO;
import com.ezen.chord.dto.Member;
import com.ezen.chord.helper.MemberHelper;
import com.ezen.chord.service.MemberService;


@Service
/** @Service : service layer의 stereotype */

public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	
	@Autowired
	MemberHelper memberHelper;
	
	// db에서 데이터 가져오기
	@Override
	public List<Member> getMember() {
		// db와의 접속을 통해 데이터를 가공하는 것이기 때문에 daoService의 메소드를 호출한다.
		
		//memberDAO.sember(); // 없는 메소드를 명시해도,그자리에서 바로 추가 가능
		return memberDAO.getMember();
	}

	// db에 없는 데이터 가져오기
	@Override
	public List<String> getNotDBMember() throws Exception {
		// db의 데이터가 아닌 helper의 데이터 를 가져온다.
		return memberHelper.getGetNotDBmemberList();
	}

	@Override
	public void setNotDBMember(String name) throws Exception {
		memberHelper.getGetNotDBmemberList().add(name);
	}
}
