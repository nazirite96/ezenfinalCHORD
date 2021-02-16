package com.ezen.chord.chat.dto;

import java.util.ArrayList;
import java.util.List;

public class ChatMessage {
	private int chatmessage_no;             // 작성 번호
	private String chatmessage_content;     // 작성 메세지
	private String chatmessage_writedate;   // 작성일
	private int mem_no;                     // 작성자
	private int chatroom_no;                // 채팅 번호

	// vo 에서만 사용
	private String mem_name;                // 회원 이름 (modal list 데이터)
	private int chatmessage_count;          // 안읽은 메세지 수
	private String messageWriter;           // 메시지 작성자 (chatroom.jsp 작성자 이름)
	private String messageType;             // Talk, Remove, Enter
	private int reciver;                    // 메시지 수신자 (header.jsp 목록 갱신)
	
	List<Integer> nowChatList = new ArrayList<Integer>(); // 채팅방에 실시간으로 참여중인 회원 list
	
	public int getChatmessage_no() {
		return chatmessage_no;
	}

	public void setChatmessage_no(int chatmessage_no) {
		this.chatmessage_no = chatmessage_no;
	}

	public String getChatmessage_content() {
		return chatmessage_content;
	}

	public void setChatmessage_content(String chatmessage_content) {
		this.chatmessage_content = chatmessage_content;
	}

	public String getChatmessage_writedate() {
		return chatmessage_writedate;
	}

	public void setChatmessage_writedate(String chatmessage_writedate) {
		this.chatmessage_writedate = chatmessage_writedate;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public int getChatroom_no() {
		return chatroom_no;
	}

	public void setChatroom_no(int chatroom_no) {
		this.chatroom_no = chatroom_no;
	}

	public String getMessageWriter() {
		return messageWriter;
	}

	public void setMessageWriter(String messageWriter) {
		this.messageWriter = messageWriter;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public int getChatmessage_count() {
		return chatmessage_count;
	}

	public void setChatmessage_count(int chatmessage_count) {
		this.chatmessage_count = chatmessage_count;
	}

	public List<Integer> getNowChatList() {
		return nowChatList;
	}

	public void setNowChatList(List<Integer> nowChatList) {
		this.nowChatList = nowChatList;
	}

	public int getReciver() {
		return reciver;
	}

	public void setReciver(int reciver) {
		this.reciver = reciver;
	}

	@Override
	public String toString() {
		return "ChatMessage [chatmessage_no=" + chatmessage_no + ", chatmessage_content=" + chatmessage_content
				+ ", chatmessage_writedate=" + chatmessage_writedate + ", mem_no=" + mem_no + ", chatroom_no="
				+ chatroom_no + ", mem_name=" + mem_name + ", chatmessage_count=" + chatmessage_count
				+ ", messageWriter=" + messageWriter + ", messageType=" + messageType + "]";
	}

}
