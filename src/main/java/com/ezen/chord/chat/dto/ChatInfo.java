package com.ezen.chord.chat.dto;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;

public class ChatInfo {
   @JsonInclude(JsonInclude.Include.NON_NULL)
   private int chatInfo_no;
   private String chatInfo_roomname;
   private String chatInfo_intime;
   private String chatInfo_outtime;
   private String chatInfo_deleted;
   private int mem_no;
   private int chatroom_no;

   // vo
   private String mem_name;
   private List<Integer> memberList = new ArrayList<Integer>();

   public ChatInfo() {
   }

   public ChatInfo(int mem_no, int chatroom_no, String chatInfo_roomname) {
      super();
      this.mem_no = mem_no;
      this.chatroom_no = chatroom_no;
      this.chatInfo_roomname = chatInfo_roomname;
   }

   public int getChatInfo_no() {
      return chatInfo_no;
   }

   public void setChatInfo_no(int chatInfo_no) {
      this.chatInfo_no = chatInfo_no;
   }

   public String getChatInfo_roomname() {
      return chatInfo_roomname;
   }

   public void setChatInfo_roomname(String chatInfo_roomname) {
      this.chatInfo_roomname = chatInfo_roomname;
   }

   public String getChatInfo_intime() {
      return chatInfo_intime;
   }

   public void setChatInfo_intime(String chatInfo_intime) {
      this.chatInfo_intime = chatInfo_intime;
   }

   public String getChatInfo_outtime() {
      return chatInfo_outtime;
   }

   public void setChatInfo_outtime(String chatInfo_outtime) {
      this.chatInfo_outtime = chatInfo_outtime;
   }

   public String getChatInfo_deleted() {
      return chatInfo_deleted;
   }

   public void setChatInfo_deleted(String chatInfo_deleted) {
      this.chatInfo_deleted = chatInfo_deleted;
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

   public String getMem_name() {
      return mem_name;
   }

   public void setMem_name(String mem_name) {
      this.mem_name = mem_name;
   }

   public List<Integer> getMemberList() {
      return memberList;
   }

   public void setMemberList(List<Integer> memberList) {
      this.memberList = memberList;
   }

}