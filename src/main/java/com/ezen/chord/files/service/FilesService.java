package com.ezen.chord.files.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ezen.chord.files.dto.FilesDTO;

public interface FilesService {

	//파일 등록
	int insertFile(FilesDTO filedto,String original,String name, String size);
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
	//메서드 : 파일 중복 체크
	String checkName(MultipartFile files);
	//메서드 : 파일복사
	void copyInto(MultipartFile upload,String checkName);
	//메서드 : 파일 용량 따오기
	String returnFileSize(Long number);
	//메서드 : 확장다 따오기
	String fileExt(String name);
}
