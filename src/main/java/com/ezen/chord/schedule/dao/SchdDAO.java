package com.ezen.chord.schedule.dao;

import com.ezen.chord.schedule.dto.SchdDTO;

public interface SchdDAO {
	//스퀀시 가져오기
	int getSchdSeq();
	// 일정등록하기
	int insertSchd(SchdDTO dto);
}
