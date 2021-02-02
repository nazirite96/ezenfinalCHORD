package com.ezen.chord.member.service;



import com.ezen.chord.company.dto.CompanyDTO;
import com.ezen.chord.member.dto.MemberDTO;

/**
 * 비즈니스 계층
 * 클라이언트의 요구사항이 반영되는 영역
 * 하나 이상의 DAO를 이용(조합)하여 비즈니스 로직을 처리
 * Controller - Service - ServiceImpl - DAO
 * */

public interface MemberService {
	
	/*회원가입*/
	public int join_mailChkService(String email);
	public int join_memJoinFunctionService(MemberDTO dto);
	
	/*로그인*/
	public int login_EmailChkService(String email);
	public int login_PwdChkSevice(MemberDTO dto);
	public MemberDTO login_GetUserInfoService(String email);
	public String login_getGradeService(String email);
	public int login_userLogDataService(int mem_no);
	public CompanyDTO login_getComPwdService(int com_no);
	
	
	
	
}
