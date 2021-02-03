package com.ezen.chord.reply.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.reply.dao.ReplyDAO;
import com.ezen.chord.reply.dto.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlmap;

	@Override
	public int insertRep(ReplyDTO repDTO) {
		// TODO Auto-generated method stub
		return sqlmap.insert("insertRep", repDTO);
	}

	@Override
	public List<ReplyDTO> selcetRepByTim_no(int tim_no) {
		// TODO Auto-generated method stub
		return sqlmap.selectList("selcetRepByTim_no", tim_no);
	}

	@Override
	public int deleteRep(int rep_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateRep(ReplyDTO repDTO) {
		// TODO Auto-generated method stub
		return sqlmap.update("update", repDTO);
	}

}
