package com.ezen.chord.box.dao;

import java.util.List;

import com.ezen.chord.box.dto.BoxDTO;

public interface BoxDAO {
	
	public List<BoxDTO> selectBox(int mem_no);
	public List<BoxDTO> selectBoxJoinBoxPro(int mem_no,int pro_no);
	
	public int insertBox(BoxDTO boxDTO);

}
