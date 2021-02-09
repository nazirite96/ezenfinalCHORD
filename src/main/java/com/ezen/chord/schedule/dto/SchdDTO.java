package com.ezen.chord.schedule.dto;

import java.sql.Date;

public class SchdDTO {
	
	private int schd_no;		//// 번호
	private String schd_loc; 	////장소
	private String schd_memo;	////내용
	
	private String time_start_date;		////저장될 시간타입
	private String time_end_date;		////저장될 시간타입
	
	
	private String cont_kind;	//// 해당 컨텐츠 분류
	private int cont_no; 		//// 해당 컨텐츠 번호
	private String tim_cont;	//// 제목
	private Date tim_date;  	////등록시간
	private int pro_no;			//// 해당프로젝트 번호
	private int mem_no;			//// 해당 맴버 번호
	
	
	
	public SchdDTO(int schd_no, String schd_loc, String schd_memo, String time_start_date, String time_end_date,
			String cont_kind, int cont_no, String tim_cont, Date tim_date, int pro_no, int mem_no) {
		super();
		this.schd_no = schd_no;
		this.schd_loc = schd_loc;
		this.schd_memo = schd_memo;
		this.time_start_date = time_start_date;
		this.time_end_date = time_end_date;
		this.cont_kind = cont_kind;
		this.cont_no = cont_no;
		this.tim_cont = tim_cont;
		this.tim_date = tim_date;
		this.pro_no = pro_no;
		this.mem_no = mem_no;
	}
	public int getSchd_no() {
		return schd_no;
	}
	public void setSchd_no(int schd_no) {
		this.schd_no = schd_no;
	}
	public String getSchd_loc() {
		return schd_loc;
	}
	public void setSchd_loc(String schd_loc) {
		this.schd_loc = schd_loc;
	}
	public String getSchd_memo() {
		return schd_memo;
	}
	public void setSchd_memo(String schd_memo) {
		this.schd_memo = schd_memo;
	}
	public String getTime_start_date() {
		return time_start_date;
	}
	public void setTime_start_date(String time_start_date) {
		this.time_start_date = time_start_date;
	}
	public String getTime_end_date() {
		return time_end_date;
	}
	public void setTime_end_date(String time_end_date) {
		this.time_end_date = time_end_date;
	}
	public String getCont_kind() {
		return cont_kind;
	}
	public void setCont_kind(String cont_kind) {
		this.cont_kind = cont_kind;
	}
	public int getCont_no() {
		return cont_no;
	}
	public void setCont_no(int cont_no) {
		this.cont_no = cont_no;
	}
	public String getTim_cont() {
		return tim_cont;
	}
	public void setTim_cont(String tim_cont) {
		this.tim_cont = tim_cont;
	}
	public Date getTim_date() {
		return tim_date;
	}
	public void setTim_date(Date tim_date) {
		this.tim_date = tim_date;
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	
	
	
	
	
	
	
}
