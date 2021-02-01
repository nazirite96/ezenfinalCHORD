package com.ezen.chord.company.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.company.dao.CompanyDAO;
import com.ezen.chord.company.dto.CompanyDTO;
import com.ezen.chord.company.service.CompanyService;
import com.ezen.chord.member.dto.MemberDTO;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	CompanyDAO cdao;
	
	/*기존 회사 넘버 확인*/
	@Override
	public int exComNoChkService(int num) {
		int result = cdao.comNoCheckDAO(num);
		return result;
	}

	/*기존 회사 비밀번호 확인*/
	@Override
	public int exComPwdChkService(CompanyDTO cdto) {
		int result = cdao.comPwdCheckDAO(cdto);
		return result;
	}
	
	/*멤버에 기존 회사 넘버 업데이트 해주기*/
	@Override
	public int exComNoUpdateService(MemberDTO mdto) {
		int result = cdao.comNoUpdateDAO(mdto);
		return result;
	}
	
	/*회사 설립*/
	@Override
	public int buildCompanyService(CompanyDTO cdto) {
		int result = cdao.buildCompanyDAO(cdto);
		return result;
	}
	
	/*새 회사_회사 넘버 찾기*/
	@Override
	public int findComNoService(String email) {
		int result = cdao.findComNoDAO(email);
		return result;
	}
	
	/*새 회사_position 정해주기*/
	@Override
	public int newPositionInsertService(Map map) {
		int result = cdao.newPositionInsertDAO(map);
		return result;
	}
	
	/*새 회사_멤버 넘버 찾기*/
	@Override
	public int findMemNoService(String mem_email) {
		int result = cdao.findMemNoDAO(mem_email);
		return result;
	}
	
	/*자동 로그인*/
	@Override
	public String comGetNameService(String mem_email) {
		String result = cdao.comGetNameDAO(mem_email);
		return result;
	}

}
