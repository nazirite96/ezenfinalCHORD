package com.ezen.chord.schedule.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	@Override
	public List<SchdDTO> getSchdMyList(int mem_no) {
		// TODO Auto-generated method stub
		return dao.getSchdMyList(mem_no);
	}
	@Override
	public List<SchdDTO> getInvited_Schd(int mem_no) {
		// TODO Auto-generated method stub
		return dao.getInvited_Schd(mem_no);
	}
	@Override
	public Map<String, Object> groupCalendarList(int mem_no) {
		// TODO Auto-generated method stub
		List<SchdDTO> mySchedule = dao.getSchdMyList(mem_no);
		List<SchdDTO> invitedSchd = dao.getInvited_Schd(mem_no);
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("mySchedule", mySchedule);
		returnMap.put("invitedSchd", invitedSchd);
		return returnMap;
	}
	@Override
	public SchdDTO getSchdOne(int schd_no) {
		// TODO Auto-generated method stub
		return dao.getSchdOne(schd_no);
	}
	@Override
	public List<Map<String,String>> tu_mem_list(int schd_no) {
		// TODO Auto-generated method stub
		return dao.tu_mem_list(schd_no);
	}
	@Override
	public int updateTitle(int cont_no, String tim_cont) {
		// TODO Auto-generated method stub
		return dao.updateTitle(cont_no, tim_cont);
	}
	@Override
	public int updateLocMemo(int schd_no, String schd_loc, String schd_memo) {
		// TODO Auto-generated method stub
		return dao.updateLocMemo(schd_no, schd_loc, schd_memo);
	}
	@Override
	public int updateTime(int cont_no, String start, String end) {
		// TODO Auto-generated method stub
		return dao.updateTime(cont_no, start, end);
	}
}
