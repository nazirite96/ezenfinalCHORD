package com.ezen.chord.member.dao;


import com.ezen.chord.member.dto.MemberDTO;

/**
 * DB를 사용해 데이터를 조화하거나 조작하는 기능
 * 사용자는 자신이 필요한 Interface를 DAO에게 던지고 DAO는 이 인터페이스를 구현한 객체를 사용자에게 편리하게 사용 할 수 있도록 반환
 * dao : 효율적인 커넥션 관리와 보안성
 * 도메인 로직을 persistence layer 와 분리
 * */
public interface MemberDAO {
	
	/*회원가입*/
	public int memJoin_emailChkDAO(String email);
	public int memJoin_joinFunctionDAO(MemberDTO dto);
	
	/*로그인*/
	public int login_EmailChkDAO(String email);
	public int login_PwdChkDAO(MemberDTO dto);
	public MemberDTO login_GetUserInfoDAO(String email);
	public String login_getGradeDAO(String email);
	public int login_userLogDataDAO(int mem_no);
	
}
