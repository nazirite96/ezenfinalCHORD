package com.ezen.chord.company.dao;

import java.util.Map;

import com.ezen.chord.company.dto.CompanyDTO;
import com.ezen.chord.member.dto.MemberDTO;

public interface CompanyDAO {

	/*기존회사*/
	public Integer comNoCheckDAO(int num);
	public int comPwdCheckDAO(CompanyDTO cdto);
	public int comNoUpdateDAO(MemberDTO mdto);
	
	/*새 회사*/
	public int buildCompanyDAO(CompanyDTO cdto);
	public int findComNoDAO(String email); 
	public int newPositionInsertDAO(Map map);
	public int findMemNoDAO(String mem_email);
	
	/*자동로그인*/
	public MemberDTO comGetNameDAO(String mem_email);
}
