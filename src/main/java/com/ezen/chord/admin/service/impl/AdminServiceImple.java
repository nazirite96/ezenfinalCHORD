package com.ezen.chord.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.admin.dao.AdminDAO;
import com.ezen.chord.admin.service.AdminService;
import com.ezen.chord.company.dto.CompanyDTO;

@Service
public class AdminServiceImple implements AdminService {

	
	@Autowired
	AdminDAO adao;
	
	
	/* 웹 사이트 운영자_회원로그인기록 list */
	@Override
	public List adminLogDataService() {
		List result = adao.adminLogDataDAO();
		return result;
	}
	
	/*회사 관리자_회사정보 조회 및 수정*/
	@Override
	public CompanyDTO adminComUpdateFormService(int com_no) {
		CompanyDTO result = adao.adminComUpdateFormDAO(com_no);
		//System.out.println("admin_service: 회사정보: "+result);
		return result;
	}

	/*회사 관리자_회사정보 수정*/
	@Override
	public int adminComUpdateService(CompanyDTO cdto) {
		int result = adao.adminComUpdateDAO(cdto);
		//System.out.println("admin_service: 회사수정완료"+result);
		return result;
	}
	
	/*회사 관리자_회원관리(회원 목록)*/
	@Override
	public List<Map<String, Object>> adminMemListService(int com_no) {
		List<Map<String, Object>> list = adao.adminMemListDAO(com_no);
		if(list.size()==0 || list.toString()==null) {System.out.println("문제.");}
		//System.out.println("admin_service: 회사수정완료"+list.toString());
		return list;
	}
	
	/*회사 관리자_회원관리(한명의 회원정보 조회)*/
	@Override
	public List<Map<String, Object>> adminMemContentsService(int mem_no) {
		List<Map<String, Object>> list = adao.adminMemContentsDAO(mem_no);
		return list;
	}
	
	/*회사 관리자_회원관리(관리자 입력)*/
	@Override
	public int adminPositionInsertService(Map<String, Integer> map) {
		int result = adao.adminPositionInsertDAO(map);
		return result;
	}
	
	/*회사 관리자_회원관리(관리자 삭제)*/
	@Override
	public int adminPositionDeleteService(int mem_no) {
		int result = adao.adminPositionDeleteDAO(mem_no);
		System.out.println("service 관리자 삭제"+result);
		return result;
	}
}
