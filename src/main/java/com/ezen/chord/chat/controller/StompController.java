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

	private String messageType = null;

	@MessageMapping("/request/login/{mem_no}")
	public void login() throws Exception {
	}

	@MessageMapping("/request/chat/{chatroom_no}")
	public void chatroom(ChatMessage chatMessage) throws Exception {

		messageType = chatMessage.getMessageType();
		int chatroom_no = chatMessage.getChatroom_no();

		if (messageType.equals("enter")) {
			List<Integer> nowChatList = new ArrayList<Integer>();
			Map<Integer, Map<String, Object>> socketNowChatMap = webSocketHelper.getSocketNowChatMap();
			for (Integer key : socketNowChatMap.keySet()) {
				Map<String, Object> optionMap = socketNowChatMap.get(key);
				int mem_chatroom_no = (int) optionMap.get("chatroom_no");
				if (chatroom_no == mem_chatroom_no) {
					nowChatList.add((int) optionMap.get("mem_no"));
				};
			}
			chatMessage.setNowChatList(nowChatList);

			if (webSocketHelper.getNewChatroomList().contains(chatroom_no)) {
				chatMessage.setChatmessage_content(chatMessage.getMessageWriter() + "님이 새로운 채팅방을 만들었습니다. ^_^");
				chatMessage.setMessageType("new");
				chatMessage.setMem_no(0);
				messageType = "new";
				webSocketHelper.getNewChatroomList().remove(new Integer(chatroom_no));
			}
		}

		sendChatMessage(chatMessage);

		if (messageType.equals("talk") || messageType.equals("remove") || messageType.equals("new")) {
			addChatroomList(chatMessage);
		}
	}

	public void addChatroomList(ChatMessage chatMessage) {

		messageType = chatMessage.getMessageType();
		int chatroom_no = chatMessage.getChatroom_no();

		List<MemberDTO> chatMemberList = webSocketHelper.getChatInfoMap().get(chatroom_no);

		for (MemberDTO m : chatMemberList) {
			if (webSocketHelper.getSocketLoginMap().containsKey(m.getMem_no())) {

				if (chatMemberList.size() == 2) {
					for (int i = 0; i < chatMemberList.size(); i++) {
						if (m.getMem_no() != chatMemberList.get(i).getMem_no()) {
							chatMessage.setReciver(chatMemberList.get(i).getMem_no());
						}
					}
				}
				chatMessage = messageType.equals("talk") || messageType.equals("new")? updateUnReadChatCount(m.getMem_no(), chatMessage): chatMessage;

				simpMessagingTemplate.convertAndSend("/sub/response/login/" + Integer.toString(m.getMem_no()),chatMessage);
				chatMessage.setChatmessage_count(0);
			}
		}
	}

	public void sendChatMessage(ChatMessage chatMessage) {

		try {
			if (messageType.equals("talk") || messageType.equals("new")) {
				SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				getChatmessage_writedate(format, chatMessage);
				chatMessageService.setChatMessage(chatMessage);
			}
			SimpleDateFormat format = new SimpleDateFormat("a hh:mm");
			getChatmessage_writedate(format, chatMessage);
			simpMessagingTemplate.convertAndSend("/sub/response/chat/" + Integer.toString(chatMessage.getChatroom_no()),
					chatMessage);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
	}

	public ChatMessage updateUnReadChatCount(int mem_no, ChatMessage chatMessage) {

		Map<Integer, Map<String, Object>> socketNowChatMap = webSocketHelper.getSocketNowChatMap();

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
