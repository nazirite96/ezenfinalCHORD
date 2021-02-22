package com.ezen.chord.reply.service;

import java.util.List;

import com.ezen.chord.reply.dto.ReplyDTO;

public interface ReplyService {
	
	
	public int insertRep(ReplyDTO repDTO);
	public List<ReplyDTO> selectRepBytim_no(int tim_no);
	public int deleteRep(int rep_no);
	public int updateRep(ReplyDTO repDTO);

}
