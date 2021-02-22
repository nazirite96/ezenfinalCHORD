package com.ezen.chord.admin.dao;

import java.util.List;
import java.util.Map;

import com.ezen.chord.company.dto.CompanyDTO;
import com.ezen.chord.member.dto.MemberDTO;

public interface AdminDAO {

	/* 웹 사이트 운영자_회원로그인기록 list */
	public List<Map<String, Object>> adminLogDataDAO(); 
	public List<Map<String, Object>> adminFileListDAO();
	public MemberDTO adminFindingMemDAO(String mem_name);
	
	/*회사 관리자_회사정보 조회 및 수정*/
	public CompanyDTO adminComUpdateFormDAO(int comNo);
	public int adminComUpdateDAO(CompanyDTO cdto);
	
	/*회사 관리자_회원관리*/
	public List<Map<String, Object>> adminMemListDAO(int com_no);
	public List<Map<String, Object>> adminMemContentsDAO(int mem_no);
	public int adminPositionInsertDAO(Map<String, Integer> map);
	public int adminPositionDeleteDAO(int mem_no);
	public int adminMemInfoInsertDAO(MemberDTO mdto);
	public int adminMemInfoUpdateDAO(MemberDTO mdto);
	
	/*회사 관리자_프로젝트*/
	public List<Map<String, Object>> adminProjectListDAO(int cp,int ls,int com_no);
	public List<Map<String, Object>> adminProContentsDAO(int pro_no);
	public List<Map<String, Object>> adminProInfoDAO(int pro_no);
	
	public int adminTotalCntDAO(int com_no);

	
	
	
}
