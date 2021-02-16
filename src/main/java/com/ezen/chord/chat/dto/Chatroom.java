package com.ezen.chord.chat.dto;

public class Chatroom {

	private int chatroom_no;
	private String chatroom_pwd;
	private String chatroom_notice;
	private int chatroom_type; // 1:1 or 1:N

	public int getChatroom_no() {
		return chatroom_no;
	}

	public void setChatroom_no(int chatroom_no) {
		this.chatroom_no = chatroom_no;
	}

	public String getChatroom_pwd() {
		return chatroom_pwd;
	}

	public void setChatroom_pwd(String chatroom_pwd) {
		this.chatroom_pwd = chatroom_pwd;
	}

	public String getChatroom_notice() {
		return chatroom_notice;
	}

	public void setChatroom_notice(String chatroom_notice) {
		this.chatroom_notice = chatroom_notice;
	}

	public int getChatroom_type() {
		return chatroom_type;
	}

	public void setChatroom_type(int chatroom_type) {
		this.chatroom_type = chatroom_type;
	}
}