package com.ezen.chord.files.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ezen.chord.files.dto.FilesDTO;

public interface FilesService {

	//파일 등록
	int insertFile(FilesDTO filedto,String original,String name, String size,int mem_no);
	//파일 삭제
	int delFile(String filename);
	//파일 수정
	int updateFile(int fileno);
	//경로 수정
	int updateFatch(String filename, String pathRoot);
	//확장자로 구별하기
	List<FilesDTO> etcList(String etc);
	//전체 파일 조회
	List<FilesDTO> getAllFiles();
	//해당 파일 이름으로 경로 조회
	String getPath(String filename);
	//해당 파일 경로로 경로 조회
	List<FilesDTO> getDBPath(String fullPath);
	//세션에 올릴 경로들
	List<String> pathList();
	//해당 파일 경로로 삭제
	int delDBPath(String fullPath);
	//해당 설정되어있는 프로젝트 이름 
	List<String> getproName(int memNo);
	//폴더 생성
	void addFolder(String foldername);
	//폴더 삭제
	void delFolder(String foldername);
	//프로젝트 이름 변경시 해당 경로 전부 변경
	int proDBPath(String original_name,String rename,String whereinfo);
	
	//프로젝트 번호 가져오기 
	int fileNo(String name);
	//파일 로그가 저장될거임
	int log_fileInsert(int file_no,int mem_no);
	
	
	//메서드 : 파일 중복 체크
	String checkName(MultipartFile files);
	//메서드 : 파일복사
	void copyInto(MultipartFile upload,String checkName,String serv);
	//메서드 : 파일 용량 따오기
	String returnFileSize(Long number);
	//메서드 : 확장다 따오기
	String fileExt(String name);
	//메서드 : 파일 이동
	void fileMove(String inFileName, String outFileName);
	//메서드 : 파일 삭제 
	void fileDelete(String deleteFileName);
	//메서드 : 폴더 삭제
	void folderDel(String deleteFolderName,String path);
	
	//메서드 : 프로젝트개설시 폴더 생성 (기웅아 이거 가져다 써라)
	void createProfolder(String pro_name,String realpath);
	//메서드 : 프로젝트삭제시 폴더 제거 (기웅아 이거 가져다 써라)
	void delProfolder(String pro_name,String realpath);
	//메서드 : 프로젝트가 변경될시 (기웅아 이거 가져다 써라)
	void changePro(String pro_name);
	
}
