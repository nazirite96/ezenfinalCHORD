package com.ezen.chord.schedule.dao;

import com.ezen.chord.schedule.dto.SchdDTO;

public interface SchdDAO {
	//스퀀시 가져오기
	int getSchdSeq();
	// 일정등록하기
	int insertSchd(SchdDTO dto);
	// 참가자 등록하기
	int insertParti(SchdDTO dto);
	// 시간텡리블 등록하기
	int insertTime(SchdDTO dto);
	// 타임라인테이블 등록
	int insertTimeLine(SchdDTO dto);
}
