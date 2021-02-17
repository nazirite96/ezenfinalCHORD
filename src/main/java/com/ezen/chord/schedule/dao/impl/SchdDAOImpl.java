package com.ezen.chord.schedule.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.schedule.dao.SchdDAO;
import com.ezen.chord.schedule.dto.SchdDTO;

@Repository
public class SchdDAOImpl implements SchdDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	
	@Override
	public int getSchdSeq() {
		// TODO Auto-generated method stub
		int result = sqlMap.selectOne("getSchdSeq");
		return result;
	}
	@Override
	public int insertSchd(SchdDTO dto) {
		// TODO Auto-generated method stub
		int result = sqlMap.insert("insertSchd",dto);
		return result;
	}
	@Override
	public int insertParti(SchdDTO dto) {
		// TODO Auto-generated method stub
		int result = sqlMap.insert("insertParti",dto);
		return result;
	}
	@Override
	public int insertTime(SchdDTO dto) {
		// TODO Auto-generated method stub
		int result = sqlMap.insert("insertSchdulDate",dto);
		return result;
	}
	@Override
	public int insertTimeLine(SchdDTO dto) {
		// TODO Auto-generated method stub
		int result= sqlMap.insert("insertTimeLine", dto);
		return result;
	}
	@Override
	public List<SchdDTO> getSchdMyList(int mem_no) {
		// TODO Auto-generated method stub
		List<SchdDTO> getSchdMyList=sqlMap.selectList("getSchdMyList", mem_no);
		return getSchdMyList;
	}
	@Override
	public List<SchdDTO> getInvited_Schd(int mem_no) {
		// TODO Auto-generated method stub
		List<SchdDTO> getInvited_Schd=sqlMap.selectList("getInvited_Schd", mem_no);
		return getInvited_Schd;
	}
	@Override
	public SchdDTO getSchdOne(int schd_no) {
		// TODO Auto-generated method stub
		SchdDTO getSchdOne=sqlMap.selectOne("getSchdOne", schd_no);
		List<Map<String,String>> tu_mem=tu_mem_list(schd_no); 
		getSchdOne.setMem_list(tu_mem);
		return getSchdOne;
	}
	@Override
	public List<Map<String,String>> tu_mem_list(int schd_no) {
		// TODO Auto-generated method stub
		List<Map<String,String>> tu_mem_list=sqlMap.selectList("tu_mem_list", schd_no);
		return tu_mem_list;
	}
	@Override
	public int updateTitle(int cont_no, String tim_cont) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tim_cont", tim_cont);
		map.put("cont_no", cont_no);
		int updateTitle=sqlMap.update("updateTitle", map);
		return updateTitle;
	}
	@Override
	public int updateLocMemo(int schd_no, String schd_loc, String schd_memo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schd_no", schd_no);
		map.put("schd_loc", schd_loc);
		map.put("schd_memo", schd_memo);
		int updateLocMemo=sqlMap.update("updateLocMemo", map);
		return updateLocMemo;
	}
	@Override
	public int updateTime(int cont_no, String start, String end) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		map.put("start", start);
		map2.put("end", end);
		map.put("cont_no", cont_no);
		map2.put("cont_no", cont_no);
		int updateTimeSE=sqlMap.update("updateTimeS", map);
		updateTimeSE=sqlMap.update("updateTimeE", map2);
		return updateTimeSE;
	}
}
