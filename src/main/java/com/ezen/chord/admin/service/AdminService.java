package com.ezen.chord.admin.service;

import java.util.List;
import java.util.Map;

import com.ezen.chord.company.dto.CompanyDTO;

public interface AdminService {

	/* 웹 사이트 운영자_회원로그인기록 list */
	public List adminLogDataService();
	
	/*회사 관리자_회사정보 조회 및 수정*/
	public CompanyDTO adminComUpdateFormService(int comNo);
	/*회사 관리자_회사정보 수정*/
	public int adminComUpdateService(CompanyDTO cdto);
	/*회사 관리자_회원관리 */
	public List<Map<String, Object>> adminMemListService(int com_no);
	public List<Map<String, Object>> adminMemContentsService(int mem_no);
	public int adminPositionInsertService(Map<String, Integer> map);
	public int adminPositionDeleteService(int mem_no);
}
