package com.ezen.chord.chat.dto;

import java.util.ArrayList;
import java.util.List;

public class ChatMessage {
	private int chatmessage_no;
	private String chatmessage_content;
	private String chatmessage_writedate;
	private int mem_no;
	private int chatroom_no;
	private String mem_name;
	private int member_count;
	private int chatmessage_count;
	private String chatroomName;
	private int reciver;
	private String chatroom_type;
	private String messageWriter;
	private String messageType;

	List<Integer> nowChatList = new ArrayList<Integer>();

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

	public String getChatroomName() {
		return chatroomName;
	}

	public void setChatroomName(String chatroomName) {
		this.chatroomName = chatroomName;
	}

	public String getChatroom_type() {
		return chatroom_type;
	}

	public void setChatroom_type(String chatroom_type) {
		this.chatroom_type = chatroom_type;
	}

	public int getMember_count() {
		return member_count;
	}

	public void setMember_count(int member_count) {
		this.member_count = member_count;
	}

	@Override
	public String toString() {
		return "ChatMessage [chatmessage_no=" + chatmessage_no + ", chatmessage_content=" + chatmessage_content
				+ ", chatmessage_writedate=" + chatmessage_writedate + ", mem_no=" + mem_no + ", chatroom_no="
				+ chatroom_no + ", mem_name=" + mem_name + ", chatmessage_count=" + chatmessage_count
				+ ", messageWriter=" + messageWriter + ", messageType=" + messageType + "," + "chatroom_type="
				+ chatroom_type + "]";
	}

}
