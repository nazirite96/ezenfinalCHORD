package com.ezen.chord.box.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.box.dao.BoxDAO;
import com.ezen.chord.box.dto.BoxDTO;
import com.ezen.chord.box.service.BoxService;

@Service
public class BoxServiceImpl implements BoxService {
	
	@Autowired
	private BoxDAO boxDAO;
	
	@Override
	public List<BoxDTO> getBoxList(int mem_no) {
		// TODO Auto-generated method stub
		return boxDAO.selectBox(mem_no);
	}
	@Override
	public List<BoxDTO> getBoxListJoinPro_no(int mem_no, int pro_no) {
		// TODO Auto-generated method stub
		return boxDAO.selectBoxJoinBoxPro(mem_no, pro_no);
	}
	
	@Override
	public int insertBox(BoxDTO boxDTO) {
		// TODO Auto-generated method stub
		return boxDAO.insertBox(boxDTO);
	}
}
