package com.ezen.chord.chat.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import com.ezen.chord.chat.dto.ChatMessage;
import com.ezen.chord.chat.service.ChatMessageService;
import com.ezen.chord.chat.socketHelper.WebSocketHelper;
import com.ezen.chord.member.dto.MemberDTO;

@Controller
public class StompController {

	@Autowired
	WebSocketHelper webSocketHelper;

	@Autowired
	ChatMessageService chatMessageService;

	private final SimpMessagingTemplate simpMessagingTemplate;

	@Autowired
	public StompController(SimpMessagingTemplate template) {
		this.simpMessagingTemplate = template;
	}

	// 로그인 Socket
	@MessageMapping("/request/login/{mem_no}")
	public void login() throws Exception {
		System.out.println("## login Stomp 컨트롤러 ##");
	}

	// 채팅방 Socket
	@MessageMapping("/request/chat/{chatroom_no}")
	public void chatroom(ChatMessage chatMessage) throws Exception {
		System.out.println("## chatroom Stomp 컨트롤러 ##");
		String messageType = chatMessage.getMessageType();
		int chatroom_no = chatMessage.getChatroom_no();
		
		// enter = '입장'
		if (messageType.equals("enter")) {
			List<Integer>nowChatList = new ArrayList<Integer>();
			Map<Integer, Map<String, Object>> socketNowChatMap = webSocketHelper.getSocketNowChatMap();
			for(Integer key : socketNowChatMap.keySet()){
					Map<String, Object> optionMap = socketNowChatMap.get(key);
				    int mem_chatroom_no = (int)optionMap.get("chatroom_no");
					if(chatroom_no == mem_chatroom_no) {
						nowChatList.add((int)optionMap.get("mem_no"));
					};
		        }
		chatMessage.setNowChatList(nowChatList); // 현재 채팅방 참여자 list를 각각 입장한 회원들에게 전달
		
		// talk = '대화'
		}else if (messageType.equals("talk")) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			getChatmessage_writedate(format, chatMessage);
			chatMessageService.setChatMessage(chatMessage); // chatmessage Table Insert
		}
		
		// topic : chatroom.jsp (채팅방 내의 메세지 갱신)
		sendChatMessage(chatMessage); 
		// topic : header.jsp (chatList Modal 내의 메세지 갱신)
		if(messageType.equals("talk") || messageType.equals("remove")) {
			addChatroomList(chatMessage);
		}
	}

	// 채팅 목록 갱신(채팅(안읽은 메세지 카운트), 삭제)
	public void addChatroomList(ChatMessage chatMessage) {
		String message_type = chatMessage.getMessageType();
		int chatroom_no = chatMessage.getChatroom_no();
		
		List<MemberDTO> chatMemberList = webSocketHelper.getChatInfoMap().get(chatroom_no);

		for (MemberDTO m : chatMemberList) {
			if (webSocketHelper.getSocketLoginMap().containsKey(m.getMem_no())) {
				// setReciver 개인방일때만 ,
				/**
				 * 채팅방 참여자에게 각각 상대방의 mem_no를 보낸준다. (채팅방 목록이 mem_no를 구분자로 이뤄지고 있기 때문이다.) ex. 루피
				 * -> 조로 mem_no , 조로-> 루피 mem_no
				 */
				for (int i = 0; i < chatMemberList.size(); i++) {
					if (m.getMem_no() != chatMemberList.get(i).getMem_no()) {
						chatMessage.setReciver(chatMemberList.get(i).getMem_no());
					}
				}
				chatMessage = message_type.equals("talk")?updateUnReadChatCount(m.getMem_no(), chatMessage):chatMessage;
				simpMessagingTemplate.convertAndSend("/sub/response/login/" + Integer.toString(m.getMem_no()),chatMessage);
				chatMessage.setChatmessage_count(0);
			}
		}
	}

	// 채팅 메세지 보내기
	public void sendChatMessage(ChatMessage chatMessage) {
		SimpleDateFormat format = new SimpleDateFormat("(a) HH:mm");
		getChatmessage_writedate(format, chatMessage);
		simpMessagingTemplate.convertAndSend("/sub/response/chat/" + Integer.toString(chatMessage.getChatroom_no()),
				chatMessage);
	}

	public ChatMessage updateUnReadChatCount(int mem_no, ChatMessage chatMessage) {
		Map<Integer, Map<String, Object>> socketNowChatMap = webSocketHelper.getSocketNowChatMap(); // 채팅방에 현재 들어와있는 사람
		// 1. 채팅방 회원중 현재 채팅방을 참여하지 않고 잇다면
		if (!(socketNowChatMap.containsKey(mem_no))) {
			chatMessage.setChatmessage_count(1);
		}
		return chatMessage;
	}

	public void getChatmessage_writedate(SimpleDateFormat format, ChatMessage chatMessage) {
		String chatmessage_writedate = format.format(System.currentTimeMillis());
		chatMessage.setChatmessage_writedate(chatmessage_writedate);
	}
}
