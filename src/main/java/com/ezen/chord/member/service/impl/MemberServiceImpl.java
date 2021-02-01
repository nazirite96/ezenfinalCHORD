package com.ezen.chord.member.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.ezen.chord.member.dao.MemberDAO;
import com.ezen.chord.member.dto.MemberDTO;
import com.ezen.chord.member.service.MemberService;


@Service
/** @Service : service layer의 stereotype */
public class MemberServiceImpl implements MemberService {
	

	@Autowired
	MemberDAO mdao;
	
	
	/*회원가입 이메일 중복 검사*/
	@Override
	public int join_mailChkService(String email) {
		int result = mdao.memJoin_emailChkDAO(email);
		return result;
	}
	
	/*회원가입 기능*/
	@Override
	public int join_memJoinFunctionService(MemberDTO dto) {
		int result = mdao.memJoin_joinFunctionDAO(dto);
		return result;
	}
	
	/*로그인 이메일 확인*/
	@Override
	public int login_EmailChkService(String email) {
		int result = mdao.login_EmailChkDAO(email);
		return result;
	}
	
	/*로그인 비밀번호 확인*/
	@Override
	public int login_PwdChkSevice(MemberDTO dto) {
		int result = mdao.login_PwdChkDAO(dto);	
		return result;
	}
	
	/*로그인 후 유저네임 가져오기*/
	@Override
	public MemberDTO login_GetUserInfoService(String email) {
		MemberDTO result = mdao.login_GetUserInfoDAO(email);
		return result;
	}
	
	/*로그인 후 관리자 타입 가져오기*/
	@Override
	public String login_getGradeService(String email) {
		String result = mdao.login_getGradeDAO(email);
		return result;
	}
	
	/*로그인 기록 */
	@Override
	public int login_userLogDataService(int mem_no) {
		int result = mdao.login_userLogDataDAO(mem_no);
		return result;
	}

}
