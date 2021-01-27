package com.ezen.chord.service;

import java.util.List;

import com.ezen.chord.dto.Member;

/**
 * 비즈니스 계층
 * 클라이언트의 요구사항이 반영되는 영역
 * 하나 이상의 DAO를 이용(조합)하여 비즈니스 로직을 처리
 * Controller - Service - ServiceImpl - DAO
 * */
public interface MemberService {
	
//1. 명세서 작성
	
	// db 멤버 가져오기.
	public List<Member> getMember();
	
	//db 에 없는 멤버 가져오기
	public List<String> getNotDBMember() throws Exception;
	
	//db에 업는 데이터 넣기
	public void setNotDBMember(String name) throws Exception;
	
	
	
	
}
