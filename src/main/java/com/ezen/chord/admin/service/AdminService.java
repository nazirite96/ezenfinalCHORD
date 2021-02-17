package com.ezen.chord.admin.service;

import java.util.List;
import java.util.Map;

import com.ezen.chord.company.dto.CompanyDTO;
import com.ezen.chord.member.dto.MemberDTO;

public interface AdminService {

	/* 웹 사이트 운영자_회원로그인기록 list */
	public List<Map<String, Object>> adminLogDataService();
	/* 웹 사이트 운영자_파일 다운이력 list*/
	public List<Map<String, Object>> adminFileListService();
	
	/*회사 관리자_회사 */
	public CompanyDTO adminComUpdateFormService(int comNo);
	public int adminComUpdateService(CompanyDTO cdto);
	
	
	/*회사 관리자_회원관리 */
	public List<Map<String, Object>> adminMemListService(int com_no);
	public List<Map<String, Object>> adminMemContentsService(int mem_no);
	public int adminPositionInsertService(Map<String, Integer> map);
	public int adminPositionDeleteService(int mem_no);
	public int adminMemInfoInsertService(MemberDTO mdto);
	public int adminMemInfoUpdateService(MemberDTO mdto);
	
	
	/*회사관리자_프로젝트 리스트*/
	public List<Map<String, Object>> adminProjectListService(int cp,int ls,int com_no);
	public List<Map<String, Object>> adminProContentsService(int pro_no);
	public List<Map<String, Object>> adminProInfoService(int pro_no);
	
	public int adminTotalCntService(int com_no);	
	
}
