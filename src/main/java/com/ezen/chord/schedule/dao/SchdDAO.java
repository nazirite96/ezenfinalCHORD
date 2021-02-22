package com.ezen.chord.schedule.dao;

import java.util.List;
import java.util.Map;

import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.schedule.dto.SchdDTO;

public interface SchdDAO {
	//스퀀시 가져오기
	int getSchdSeq();
	// 일정등록하기
	int insertSchd(SchdDTO dto);
	// 참가자 등록하기
	int insertParti(SchdDTO dto);
	int insertPartic(int cont_no,int partic_no);
	// 시간텡리블 등록하기
	int insertTime(SchdDTO dto);
	// 타임라인테이블 등록
	int insertTimeLine(SchdDTO dto);
	// 내가 등록한 리스트들
	List<SchdDTO> getSchdMyList(int mem_no);
	// 내가 초대된 리스트들
	List<SchdDTO> getInvited_Schd(int mem_no);
	// 인덱스번호로 스케줄 리스트 뿌려주는거
	SchdDTO getSchdOne(int schd_no);
	// tu_mem_list
	List<ProjectUserDTO> tu_mem_list(int schd_no);
	//제목
	int updateTitle(int cont_no,String tim_cont);
	//장소랑 메모
	int updateLocMemo(int schd_no,String schd_loc,String schd_memo);
	//시간
	int updateTime(int cont_no,String start,String end);
	//타임랑인 삭제시 죄다삭제 
	int deltime(int cont_no);
	int delschd(int cont_no);
	int delpartic(int cont_no);
}
