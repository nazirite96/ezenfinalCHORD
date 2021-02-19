package com.ezen.chord.chat.socketHelper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ezen.chord.chat.dto.ChatInfo;
import com.ezen.chord.chat.service.ChatInfoService;
import com.ezen.chord.member.dto.MemberDTO;

@Component
public class WebSocketHelper {
	@Autowired 
	ChatInfoService chatInfoService;

	private Map<Integer, List<MemberDTO>> chatInfoMap = new HashMap<Integer, List<MemberDTO>>();

	private Map<Integer, Map<String, Object>> socketNowChatMap = new HashMap<Integer, Map<String, Object>>();

	private Map<Integer, Map<String, Object>> socketLoginMap = new HashMap<Integer, Map<String, Object>>();

	private List<Integer> newChatroomList = new ArrayList<Integer>(); 
	
	public ChatInfoService getChatInfoService() {
		return chatInfoService;
	}

	public void setChatInfoService(ChatInfoService chatInfoService) {
		this.chatInfoService = chatInfoService;
	}
	
	public void setChatInfoMap(Map<Integer, List<MemberDTO>> chatInfoMap) {
		this.chatInfoMap = chatInfoMap;
	}

	public void setSocketNowChatMap(Map<Integer, Map<String, Object>> socketNowChatMap) {
		this.socketNowChatMap = socketNowChatMap;
	}

	public void setSocketLoginMap(Map<Integer, Map<String, Object>> socketLoginMap) {
		this.socketLoginMap = socketLoginMap;
	}

	// Getter, Setter
	public Map<Integer, List<MemberDTO>> getChatInfoMap() {
		return chatInfoMap;
	}

	public void setChatInfoMap(int chatroom, List<MemberDTO> MemberDTO) {
		this.chatInfoMap.put(chatroom, MemberDTO);
	}

	public Map<Integer, Map<String, Object>> getSocketNowChatMap() {
		return socketNowChatMap;
	}

	public void setSocketNowChatMap(int mem_no, Map<String, Object> nowChatMap) {
		this.socketNowChatMap.put(mem_no, nowChatMap);
	}

	public Map<Integer, Map<String, Object>> getSocketLoginMap() {
		return socketLoginMap;
	}

	public void setSocketLoginMap(int mem_no, Map<String, Object> loginMap) {
		this.socketLoginMap.put(mem_no, loginMap);
	}

	public List<Integer> getNewChatroomList() {
		return newChatroomList;
	}

	public void setNewChatroomList(int chatroom_no) {
		this.newChatroomList.add(chatroom_no);
	}

	public void setSockMap(String subscribe, String socketId, int mem_no, int chatroom_no) {

		chatroom_no = subscribe.equals("login") ? 0 : chatroom_no;

		Map<String, Object> socketMap = new HashMap<String, Object>();
		socketMap.put("socketId", socketId);
		socketMap.put("mem_no", mem_no);
		socketMap.put("chatroom_no", chatroom_no);

		if (subscribe.equals("login")) {
			setSocketLoginMap(mem_no, socketMap);
		} else if (subscribe.equals("chat")) {
			setSocketNowChatMap(mem_no, socketMap);
		}
	}

	public void removeSockMap(int mem_no, String socketId) {
		Map<String, Object> map = new HashMap<String, Object>();
		int chatroom_no = 0;
		if (socketNowChatMap.containsKey(mem_no)) {
			map = socketNowChatMap.get(mem_no);
			chatroom_no = (int) map.get("chatroom_no");
			if (socketId.equals(map.get("socketId"))) {
				socketNowChatMap.remove(mem_no);
			}
		}

		if (socketLoginMap.containsKey(mem_no)) {
			map = socketLoginMap.get(mem_no);
			if (socketId.equals(map.get("socketId"))) {
				socketLoginMap.remove(mem_no);
			}
		}
		try {
			chatInfoService.setChatInfo_outtime(new ChatInfo(mem_no,chatroom_no,"null"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}