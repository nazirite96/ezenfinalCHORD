package com.ezen.chord.schedule.sevice.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.schedule.dao.SchdDAO;
import com.ezen.chord.schedule.dto.SchdDTO;
import com.ezen.chord.schedule.service.SchdService;

@Service
public class SchdServiceImpl implements SchdService {

	@Autowired
	SchdDAO dao;
	
	@Override
	public int getSchdSeq() {
		// TODO Auto-generated method stub
		return dao.getSchdSeq();
	}
	@Override
	public int insertSchd(SchdDTO dto) {
		// TODO Auto-generated method stub
		return dao.insertSchd(dto);
	}
	@Override
	public int insertTime(SchdDTO dto,String start,String end) {
		// TODO Auto-generated method stub
		dto.setTime_start_date(start);
		dto.setTime_end_date(end);
		return dao.insertTime(dto);
	}
	@Override
	public int insertParti(SchdDTO dto) {
		// TODO Auto-generated method stub
		return dao.insertParti(dto);
	}
	@Override
	public int insertTimeLine(SchdDTO dto) {
		// TODO Auto-generated method stub
		return dao.insertTimeLine(dto);
	}

}