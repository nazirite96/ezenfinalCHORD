package com.ezen.chord.project.service;

import java.util.List;

import com.ezen.chord.box.dto.BoxDTO;
import com.ezen.chord.project.dto.ProjectDTO;
import com.ezen.chord.project_user.dto.ProjectUserDTO;

public interface ProjectService {
	
	
	//프로젝트 생성
	int insertPro(ProjectDTO proDTO);
	
	//프로젝트 수정
	int updatePro(ProjectDTO proDTO);
	
	//프로젝트 상세 조회
	ProjectDTO getProDetail(int pro_no);
	
	//전체 프로젝트 조회
	List<ProjectUserDTO> getProAllList(int mem_no);
	//분류 조회
	List<ProjectUserDTO> getSepProList(int mem_no,int box_no);
	
	int chkProUser(int mem_no,int pro_no);
	
	int deletePro(int pro_no);
	
	int insertBoxPro(BoxDTO boxDTO);
	
	int deleteBoxPro(BoxDTO boxDTO);
	
	
	
	
}
