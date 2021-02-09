package com.ezen.chord.timeline.dto;

import java.util.List;

import com.ezen.chord.reply.dto.ReplyDTO;
import com.ezen.chord.task.dto.TaskDTO;

public class TimelineDTO {
	
	private int tim_no;				//타임라인 번호
	private String cont_kind;		//컨텐츠 타입
	private int cont_no;			//컨텐츠 번호
	private String tim_cont;			//컨텐츠 제목 베이직 글이면 컨텐츠 제목이 곧 컨텐츠
	private java.sql.Date tim_date;	//작성일
	private int pro_no;				//작성 프로젝트
	private int mem_no;				//작성자
	private List<ReplyDTO> repList; //리플
	private TaskDTO taskDTO;
	
	public TaskDTO getTaskDTO() {
		return taskDTO;
	}
	public void setTaskDTO(TaskDTO taskDTO) {
		this.taskDTO = taskDTO;
	}
	public int getTim_no() {
		return tim_no;
	}
	public void setTim_no(int tim_no) {
		this.tim_no = tim_no;
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
	public java.sql.Date getTim_date() {
		return tim_date;
	}
	public void setTim_date(java.sql.Date tim_date) {
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
	public List<ReplyDTO> getRepList() {
		return repList;
	}
	public void setRepList(List<ReplyDTO> repList) {
		this.repList = repList;
	}
	
	
}
