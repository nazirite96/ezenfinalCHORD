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
	
	/** 1
	 * Description : 해당 채팅방 소속 회원 
	 * Usage : Map<채팅방PK, List<회원DTO>>
	 */
	private Map<Integer, List<MemberDTO>> chatInfoMap = new HashMap<Integer, List<MemberDTO>>();

	/** 2
	 * Description : 채팅방 실시간 참여 회원 
	 * Usage : Map<회원PK, Map<Key:Value>>
	 */
	private Map<Integer, Map<String, Object>> socketNowChatMap = new HashMap<Integer, Map<String, Object>>();

   	/** 3 
	 * Description : 실시간 로그인 상태 회원 
	 * Usage : Map<회원PK, Map<Key:Value>>
	 */
	private Map<Integer, Map<String, Object>> socketLoginMap = new HashMap<Integer, Map<String, Object>>();

	/** 4
	 * Description : 채팅방 타입  확인 (new,'')
	 * Usage : Map<chatroom_PK, String > 
	 */
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

	/**
	 * 4 
	 * Description : socketNowChatMap과 socketLoginMap의 Value로 활용되는 휘발성 Map을 생성하여 기존 Map에 Value로 할당하는 메서드
	 * Parameters : 구독종류(login, chat), 소켓ID, 회원PK, 채팅PK
	 */
	public void setSockMap(String subscribe, String socketId, int mem_no, int chatroom_no) {

		chatroom_no = subscribe.equals("login") ? 0 : chatroom_no;

		Map<String, Object> socketMap = new HashMap<String, Object>();
		socketMap.put("socketId", socketId);
		socketMap.put("mem_no", mem_no);
		socketMap.put("chatroom_no", chatroom_no);

		if (subscribe.equals("login")) {
			setSocketLoginMap(mem_no, socketMap);
			System.out.println("## Interceptor : Login Socket 연결. (누적 : " + socketLoginMap.size() + "명) ##");
		} else if (subscribe.equals("chat")) {
			setSocketNowChatMap(mem_no, socketMap);
			System.out.println("## Interceptor : Chat Socket 연결. (누적 : " + socketNowChatMap.size() + "명) ##");
		}
	}

	/** 5
	 * Description : Socket 연결 해제 시, 소켓ID를 대조하여 일치하는 Map에서 해당 회원정보 삭제
	 *  Parameters : 회원PK, 소켓ID
	 */
	public void removeSockMap(int mem_no, String socketId) {
		Map<String, Object> map = new HashMap<String, Object>();
		int chatroom_no = 0;
		if (socketNowChatMap.containsKey(mem_no)) {
			map = socketNowChatMap.get(mem_no);
			chatroom_no = (int) map.get("chatroom_no");
			if (socketId.equals(map.get("socketId"))) {
				socketNowChatMap.remove(mem_no);
				System.out.println("## Interceptor : Chat Socket 해제. (누적 : " + socketNowChatMap.size() + "명) ##");
			}
		}

		if (socketLoginMap.containsKey(mem_no)) {
			map = socketLoginMap.get(mem_no);
			if (socketId.equals(map.get("socketId"))) {
				socketLoginMap.remove(mem_no);
				System.out.println("## Interceptor : Login Socket 해제. (누적 : " + socketLoginMap.size() + "명) ##");
			}
		}
		try {
			chatInfoService.setChatInfo_outtime(new ChatInfo(mem_no,chatroom_no,"null"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}