package com.ezen.chord.reply.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.reply.dao.ReplyDAO;
import com.ezen.chord.reply.dto.ReplyDTO;
import com.ezen.chord.reply.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO repDAO;

	@Override
	public int insertRep(ReplyDTO repDTO) {
		// TODO Auto-generated method stub
		return repDAO.insertRep(repDTO);
	}

	@Override
	public List<ReplyDTO> selectRepBytim_no(int tim_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteRep(int rep_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateRep(ReplyDTO repDTO) {
		// TODO Auto-generated method stub
		
		return repDAO.updateRep(repDTO);
	}

}
