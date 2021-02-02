package com.ezen.chord.member.dao.impl;



import org.apache.ibatis.session.SqlSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.company.dto.CompanyDTO;
import com.ezen.chord.member.dao.MemberDAO;
import com.ezen.chord.member.dto.MemberDTO;


@Repository
//* @Repository : persistence layer(영속성을 가지는 [파일, db등]) stereotype */
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSession sqlMap;

	public MemberDAOImpl(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	/*회원가입 이메일 중복 검사*/
	@Override
	public int memJoin_emailChkDAO(String email) {
		int result = sqlMap.selectOne("join_mailChk",email);
		return result;
	}
	
	/*회원가입 기능*/
	@Override
	public int memJoin_joinFunctionDAO(MemberDTO dto) {
		int result = sqlMap.insert("join_function",dto);
		return result;
	}
	
	/*로그인 이메일 확인*/
	@Override
	public int login_EmailChkDAO(String email) {
		Integer result = sqlMap.selectOne("login_mailChk",email);
		if(result==0 || result.toString()==null || result.toString().equals("")) {
			result = 0;
		}
		System.out.println("이메일 확인: "+result);
		return result;
	}
	
	/*로그인 비밀번호 확인*/
	@Override
	public int login_PwdChkDAO(MemberDTO dto) {
		Integer result = sqlMap.selectOne("login_pwdChk",dto);
		if(result==0 || result.toString()==null || result.toString().equals("")) {
			result = 0;
		}
		System.out.println("비밀번호 확인: "+result);
		return result;
	}
	
	/*로그인 후 해당 사용자정보 가져오기*/
	@Override
	public MemberDTO login_GetUserInfoDAO(String email) {
		MemberDTO result = new MemberDTO();
		try {
			result = sqlMap.selectOne("login_getUserInfo",email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getLocalizedMessage());
		}
		System.out.println(result);
		return result;
	}
	
	/*로그인 후 관리자라면, 관리자타입 가져오기*/
	@Override
	public String login_getGradeDAO(String email) {
		String result = sqlMap.selectOne("login_getGrade",email);
		result = result == null?"":result;
		return result;
	}
	
	/*로그인 기록 insert*/
	@Override
	public int login_userLogDataDAO(int mem_no) {
		int result = sqlMap.insert("login_userLogInCount",mem_no);
		return result;
	}

	/*로그인 후 회사 비밀번호 가져오기*/
	@Override
	public CompanyDTO login_getComPwdDAO(int com_no) {
		CompanyDTO result = sqlMap.selectOne("chord.member.login_getComPwd",com_no);
		if(result.toString()==null) {System.out.println("에럿");}
		return result;
	}

}
