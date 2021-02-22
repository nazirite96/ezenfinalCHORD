package com.ezen.chord.timeline.test;

import java.sql.Date;
import java.util.*;
import com.ezen.chord.task.dto.*;

public class TimeLine implements Comparable<TimeLine> {

	//타임라인
	private TaskDTO taskDTO;
	
	private Date time;
	
	
	
	public TaskDTO getTaskDTO() {
		return taskDTO;
	}



	public void setTaskDTO(TaskDTO taskDTO) {
		this.taskDTO = taskDTO;
	}



	public Date getTime() {
		return time;
	}



	public void setTime(Date time) {
		this.time = time;
	}

	

	public TimeLine(TaskDTO taskDTO, Date time) {
		super();
		this.taskDTO = taskDTO;
		this.time = time;
	}



	@Override
	public int compareTo(TimeLine timeLine) {
		return timeLine.getTime().compareTo(time);
	}

}
