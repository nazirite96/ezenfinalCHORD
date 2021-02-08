package com.ezen.chord.schedule.service;

import com.ezen.chord.schedule.dto.SchdDTO;

public interface SchdService {

	//스퀀시 가져오기
	int getSchdSeq();
	// 일정등록하기
	int insertSchd(SchdDTO dto,int seq);
}
