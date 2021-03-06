package com.ezen.chord.admin.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.admin.dao.AdminDAO;
import com.ezen.chord.company.dto.CompanyDTO;
import com.ezen.chord.member.dto.MemberDTO;

@Repository
public class AdminDAOImple implements AdminDAO {

	@Autowired
	SqlSessionTemplate sqlMap;

	public AdminDAOImple(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}


	/* 웹 사이트 운영자_회원로그인기록 list */
	@Override
	public List<Map<String, Object>> adminLogDataDAO() {
		List<Map<String, Object>> result = null;
		try {
			result = sqlMap.selectList("chord.admin.admin_getUserlogData");
		} catch (Exception e) {
			e.getLocalizedMessage();
		}
		
		return result;
	}
	
	/* 웹사이트 운영자_파일 다운 이력 list*/
	@Override
	public List<Map<String, Object>> adminFileListDAO() {
		List<Map<String, Object>> result = null;
		try {
			result = sqlMap.selectList("chord.admin.admin_fileList");
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return result;
	}
	
	/*사이트 운영자_이용자 검색*/
	@Override
	public MemberDTO adminFindingMemDAO(String mem_name) {
		
		MemberDTO mdto = sqlMap.selectOne("chord.admin.admin_searchUserInfo",mem_name);
		return mdto;
	}
	
	
	
	/*회사 관리자_회사정보 조회 및 수정*/
	@Override
	public CompanyDTO  adminComUpdateFormDAO(int com_no) {
		CompanyDTO cdto = sqlMap.selectOne("chord.admin.admin_companycontents",com_no);
		return cdto;
	}
	
	/*회사 관리자_회사정보 수정*/
	@Override
	public int adminComUpdateDAO(CompanyDTO cdto) {
		int result = sqlMap.update("chord.admin.admin_comUpdate",cdto);
		return result;
	}
	
	/*회사 관리자_멤버관리(멤버 목록)*/
	@Override
	public List adminMemListDAO(int com_no) {
		List list = sqlMap.selectList("chord.admin.admin_memList",com_no);
		if(list.size()==0 || list.toString()==null) {
			System.out.println("멤버관리에러입니다");
		}
		return list;
	}
	
	/*회사 관리자_멤버관리(한명의 회원정보 조회)*/
	@Override
	public List<Map<String, Object>> adminMemContentsDAO(int mem_no) {
		List<Map<String, Object>> list = null;
		try {
			list = sqlMap.selectList("admin_memContents",mem_no);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		//System.out.println(list.toString());
		return list;
	}
	
	/*회사 관리자_멤버관리(관리자 입력)*/
	@Override
	public int adminPositionInsertDAO(Map<String, Integer> map) {
		int result = 0;
		try {
			result = sqlMap.update("chord.company.newPositionInsertSQL",map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getLocalizedMessage());
			result = 0;
		}
		//System.out.println("회원관리_adminDAO: "+result);
		return result;
	}
	
	/*회사 관리자_멤버관리(관리자 권한 삭제)*/
	@Override
	public int adminPositionDeleteDAO(int mem_no) {
		int result = 0;
		try {
			result = sqlMap.update("chord.admin.admin_positionDelete",mem_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getLocalizedMessage());
			result = 0;
		}
		return result;
	}
	
	
	/*회원정보 직책,부서insert*/
	@Override
	public int adminMemInfoInsertDAO(MemberDTO mdto) {
		
		int result = 0;
		try {
			result = sqlMap.insert("chord.admin.admin_memInfoInsert",mdto);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		
		return result;
	}
	
	/*회원정보 직책,부서 update*/
	@Override
	public int adminMemInfoUpdateDAO(MemberDTO mdto) {
		
		int result = 0;
		try {
			result = sqlMap.update("chord.admin.admin_memInfoUpdate",mdto);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		
		return result;
	}
	
	

	/*회사관리자_프로젝트 리스트*/
	@Override
	public List<Map<String, Object>> adminProjectListDAO(int cp,int ls,int com_no) {
		
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		
		Map map = new HashMap();
		map.put("com_no", com_no);
		map.put("start", start);
		map.put("end", end);		
		
		List<Map<String, Object>> list = null;
		try {
			list = sqlMap.selectList("chord.admin.admin_projectList",map);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return list;
	}
	
	
	/*회사관리자_프로젝트 상세내용*/
	@Override
	public List<Map<String, Object>> adminProContentsDAO(int pro_no) {
		List<Map<String,Object>> list = null;
		try {
			list = sqlMap.selectList("chord.admin.admin_projectContents",pro_no);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return list;
	}
	
	/*회사관리자_프로젝트 이름가져오기*/
	@Override
	public List<Map<String, Object>> adminProInfoDAO(int pro_no) {
		List<Map<String,Object>> list = null;
		try {
			list = sqlMap.selectList("chord.admin.admin_projectInfo",pro_no);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return list;
	}
	
	/*페이지네이션을 위한 count*/
	@Override
	public int adminTotalCntDAO(int com_no) {
		int result = sqlMap.selectOne("chord.admin.admin_pageTotalCnt",com_no);
		return result;
	}

	
}
