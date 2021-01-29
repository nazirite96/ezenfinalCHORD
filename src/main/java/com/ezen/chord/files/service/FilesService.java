package com.ezen.chord.files.service;

import java.util.List;
import java.util.Map;

import com.ezen.chord.files.dto.FilesDTO;

public interface FilesService {

	//파일 등록
	int insertFile(FilesDTO filedto);
	//파일 삭제
	int delFile(int fileno);
	//파일 수정
	int updateFile(int fileno);
	//경로 수정
	Map<String, Object> updateFatch(int fileno,String fatch);
	//전체 파일 조회
	List<FilesDTO> getAllFiles(FilesDTO filedto);
	//폴더 생성
	void addFolder(String foldername);
	//폴더 삭제
	void delFolder(String foldername);
}
