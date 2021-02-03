package com.ezen.chord.files.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ezen.chord.files.dto.FilesDTO;

public interface FilesService {

	//파일 등록
	int insertFile(FilesDTO filedto,String original,String name, String size);
	//파일 삭제
	int delFile(String filename);
	//파일 수정
	int updateFile(int fileno);
	//경로 수정
	int updateFatch(String filename, String pathRoot);
	
	//전체 파일 조회
	List<FilesDTO> getAllFiles();
	//해당 파일 이름으로 경로 조회
	String getPath(String filename);
	//해당 파일 경로로 경로 조회
	List<FilesDTO> getDBPath(String fullPath);
	//해당 설정되어있는 프로젝트 이름 
	List<String> getproName(int memNo);
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
	//메서드 : 파일 이동
	void fileMove(String inFileName, String outFileName);
	//메서드 : 파일 삭제 
	void fileDelete(String deleteFileName);
}
