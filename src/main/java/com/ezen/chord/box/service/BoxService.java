package com.ezen.chord.box.service;

import java.util.List;

import com.ezen.chord.box.dto.BoxDTO;

public interface BoxService {
	
	
	public List<BoxDTO>getBoxList(int mem_no);
	public List<BoxDTO>getBoxListJoinPro_no(int mem_no,int pro_no);
	
	public int insertBox(BoxDTO boxDTO);
	

}
