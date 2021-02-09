package com.ezen.chord.schedule.service;

import com.ezen.chord.schedule.dto.SchdDTO;

public interface SchdService {

	//스퀀시 가져오기
	int getSchdSeq();
	// 일정등록하기
	int insertSchd(SchdDTO dto);
	// 참가자 등록하기
	int insertParti(SchdDTO dto);
	// 시간텡리블 등록하기
	int insertTime(SchdDTO dto,String start,String end);
	// 타임라인테이블 등록
	int insertTimeLine(SchdDTO dto);
}
