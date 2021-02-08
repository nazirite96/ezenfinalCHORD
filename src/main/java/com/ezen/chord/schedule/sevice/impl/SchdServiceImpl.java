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
	public int insertSchd(SchdDTO dto,int seq) {
		// TODO Auto-generated method stub
		dto.setSchd_no(seq);
		return dao.insertSchd(dto);
	}

}
