package com.ezen.chord.files.dao;

import java.util.List;
import java.util.Map;

import com.ezen.chord.files.dto.FilesDTO;

public interface FilesDAO {

		//파일 등록
		int insertFile(FilesDTO filedto);
		//파일 삭제
		int delFile(String filename);
		//파일 수정
		int updateFile(int fileno);
		//경로 수정
		int updateFatch(Map<String, String> map);
		//전체 파일 조회
		List<FilesDTO> getAllFiles();
		//해당 파일 경로조회
		String getPath(String filename);
		//해당 파일 경로로 경로 조회
		List<FilesDTO> getDBPath(String fullPath);
		//해당 프로젝트 가져오기
		List<String> getproName(int memNo);
		//해당 파일 경로로 삭제
		int delDBPath(String fullPath);
		//확장자로 구별하기
		List<FilesDTO> etcList(String etc);
}
