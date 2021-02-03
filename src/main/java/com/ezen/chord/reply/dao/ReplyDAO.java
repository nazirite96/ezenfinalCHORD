package com.ezen.chord.reply.dao;

import java.util.List;

import com.ezen.chord.reply.dto.ReplyDTO;

public interface ReplyDAO {
	
	
	public int insertRep(ReplyDTO repDTO);
	public List<ReplyDTO> selcetRepByTim_no(int tim_no);
	public int deleteRep(int rep_no);
	public int updateRep(ReplyDTO repDTO);
	
}
