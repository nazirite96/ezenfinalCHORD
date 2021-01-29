package com.ezen.chord.files.dao;

import java.util.List;
import java.util.Map;

import com.ezen.chord.files.dto.FilesDTO;

public interface FilesDAO {

		//파일 등록
		int insertFile(FilesDTO filedto);
		//파일 삭제
		int delFile(int fileno);
		//파일 수정
		int updateFile(int fileno);
		//경로 수정
		Map<String,Object> updateFatch(Map<String,Object> map);
		//전체 파일 조회
		List<FilesDTO> getAllFiles(FilesDTO filedto);
}
