package com.ezen.chord.helper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class MemberHelper {
	
	// DB에 없는 회원 출력
	private List<String> getNotDBmemberList = new ArrayList<String>();

	public List<String> getGetNotDBmemberList() {
		return getNotDBmemberList;
	}

	public void setGetNotDBmemberList(List<String> getNotDBmemberList) {
		this.getNotDBmemberList = getNotDBmemberList;
	}


}
