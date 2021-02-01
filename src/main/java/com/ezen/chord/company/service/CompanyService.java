package com.ezen.chord.company.service;

import java.util.Map;

import com.ezen.chord.company.dto.CompanyDTO;
import com.ezen.chord.member.dto.MemberDTO;

public interface CompanyService {

	/*기존회사*/
	public int exComNoChkService(int num);
	public int exComPwdChkService(CompanyDTO dto);
	public int exComNoUpdateService(MemberDTO mdto);
	
	/*새 회사*/
	public int buildCompanyService(CompanyDTO cdto);
	public int findComNoService(String email); 
	public int newPositionInsertService(Map map);
	public int findMemNoService(String mem_email);
	
	/*자동로그인*/
	public String comGetNameService(String mem_email);
}
