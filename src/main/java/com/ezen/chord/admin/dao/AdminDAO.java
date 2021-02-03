package com.ezen.chord.admin.dao;

import java.util.List;
import java.util.Map;

import com.ezen.chord.company.dto.CompanyDTO;

public interface AdminDAO {

	/* 웹 사이트 운영자_회원로그인기록 list */
	public List adminLogDataDAO(); 
	
	/*회사 관리자_회사정보 조회 및 수정*/
	public CompanyDTO adminComUpdateFormDAO(int comNo);
	public int adminComUpdateDAO(CompanyDTO cdto);
	
	/*회사 관리자_회원관리*/
	public List<Map<String, Object>> adminMemListDAO(int com_no);
	public List<Map<String, Object>> adminMemContentsDAO(int mem_no);
	public int adminPositionInsertDAO(Map<String, Integer> map);
	public int adminPositionDeleteDAO(int mem_no);
	
}
