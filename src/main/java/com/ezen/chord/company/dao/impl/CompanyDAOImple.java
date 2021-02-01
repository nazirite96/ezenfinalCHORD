package com.ezen.chord.company.dao.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.company.dao.CompanyDAO;
import com.ezen.chord.company.dto.CompanyDTO;
import com.ezen.chord.member.dto.MemberDTO;

@Repository
public class CompanyDAOImple implements CompanyDAO {

	@Autowired
	SqlSessionTemplate sqlMap;
	
	public CompanyDAOImple(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	/*기존회사 넘버 확인 */
	@Override
	public int comNoCheckDAO(int num) {
		
		int result = sqlMap.selectOne("comNoChkSQL",num);
		return result;
	}
	
	/*기존 회사 비밀번호 확인*/
	@Override
	public int comPwdCheckDAO(CompanyDTO cdto) {
		int result = sqlMap.selectOne("comPwdChkSQL",cdto);
		return result;
	}
	
	/*기존 회사넘버 UPDATE*/
	public int comNoUpdateDAO(MemberDTO mdto) {
		
		int result = sqlMap.update("comNoUpdateSQL",mdto);
		return result;
	}
	
	//회사 설립
	public int buildCompanyDAO(CompanyDTO cdto) {
		int result = sqlMap.insert("comInsertSQL",cdto);
		return result;
	}
	
	//com_no 데이터 가져오기
	public int findComNoDAO(String name) {

		int result = sqlMap.selectOne("findComNoSQL",name); 
		return result;
	}
	
	//새 회사 position insert해주기
	public int newPositionInsertDAO(Map map) {
		int result = sqlMap.insert("newPositionInsertSQL",map);
		return result;
	}
	
	//멤버 넘버 찾기
	public int findMemNoDAO(String mem_email) {
		int result = sqlMap.selectOne("findMemNoSQL",mem_email);
		return result;
	}	
	
	/*자동 로그인*/
	@Override
	public String comGetNameDAO(String mem_email) {
		String result = sqlMap.selectOne("autoLogin_getName",mem_email);
		return result;
	}

}
