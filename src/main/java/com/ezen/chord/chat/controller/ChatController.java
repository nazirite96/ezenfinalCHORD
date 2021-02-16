package com.ezen.chord.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ezen.chord.chat.dto.ChatInfo;
import com.ezen.chord.chat.dto.ChatMessage;
import com.ezen.chord.chat.dto.Chatroom;
import com.ezen.chord.chat.service.ChatInfoService;
import com.ezen.chord.chat.service.ChatMessageService;
import com.ezen.chord.chat.service.ChatroomService;
import com.ezen.chord.chat.socketHelper.WebSocketHelper;
import com.ezen.chord.member.dto.MemberDTO;

@Controller
public class ChatController {

	@Autowired
	ChatInfoService chatInfoService;

	@Autowired
	ChatroomService chatroomService;

	@Autowired
	ChatMessageService chatMessageService;

	@Autowired
	WebSocketHelper webSocketHelper;

	@Autowired
	HttpSession session;

	@RequestMapping(value = "getChatList.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, List<ChatMessage>> getChatList() {
		System.out.println("== getChatList 컨트롤러 ==");

		MemberDTO member = new MemberDTO();
		String mem_name = (String)session.getAttribute("name");
		int mem_no = (Integer)session.getAttribute("memNo");
		int com_no = (Integer)session.getAttribute("comNo");
		
		member.setMem_no(mem_no);
		member.setMem_name(mem_name);
		member.setCom_no(com_no);

		List<ChatMessage> privateChatList = new ArrayList<ChatMessage>(); // 개인 채팅방 목록을 담을 List 생성

		try {
			privateChatList = chatMessageService.getPrivateChatList(member);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}

		List<ChatMessage> publicChatList = new ArrayList<ChatMessage>();

		// DB 조회 결과값을 chatListMap에 Put
		Map<String, List<ChatMessage>> chatListMap = new HashMap<String, List<ChatMessage>>();
		chatListMap.put("privateChatList", privateChatList);
		chatListMap.put("publicChatList", publicChatList);

		return chatListMap;
	}

	// 채팅방 생성
	@RequestMapping(value = "createChatroom.do", method = RequestMethod.POST)
	public @ResponseBody int createChatroom(ChatInfo chatinfo) {
		System.out.println("== createChatroom 컨트롤러 ==");
		
		int myMem_no = (Integer)session.getAttribute("memNo"); // 내 mem_no
		String myMem_name = (String)session.getAttribute("name"); // 내 mem_name = chatInfo_roomname
		int yourMem_no = chatinfo.getMem_no(); // 상대방 mem_no
		String yourMem_name = chatinfo.getMem_name(); // 상대방 mem_name = chatInfo_roomname

		int chatroom_no = 0;

		try {
			chatroom_no = chatInfoService.checkChatroom(myMem_no, yourMem_no);
			if (chatroom_no != 0) {
				return chatroom_no;
			}
			// 여기서 개인 채팅방과 단체 채팅방 ChatInfo 분기처리
			Chatroom chatroom = new Chatroom();
			chatroom.setChatroom_type(0);
			chatroom_no = chatroomService.createChatroom(chatroom);

			// chatInfo Insert를 위한 변수 설정
			List<ChatInfo> memberList = new ArrayList<ChatInfo>();
			memberList.add(new ChatInfo(myMem_no, chatroom_no, yourMem_name));
			memberList.add(new ChatInfo(yourMem_no, chatroom_no, myMem_name));
			chatInfoService.setChatInfo(memberList);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return chatroom_no;
	}

	// 채팅방 진입
	@RequestMapping(value = "chatroom.do", method = RequestMethod.POST)
	public String chatroom(@RequestParam("chatroom_no") int chatroom_no, Model model) {
		System.out.println("== chatroom 컨트롤러 ==");

		int myMem_no = (Integer)session.getAttribute("memNo"); // 내 mem_no

		List<MemberDTO> chatMemberList = new ArrayList<MemberDTO>();
		List<ChatMessage> chatMessageList = new ArrayList<ChatMessage>();
		ChatInfo chatInfo = new ChatInfo();
		chatInfo.setMem_no(myMem_no);
		chatInfo.setChatroom_no(chatroom_no);

		try {
			chatMemberList = chatInfoService.getChatMemberList(chatroom_no);
			chatMessageList = chatMessageService.getChatMessage(new ChatInfo(myMem_no, chatroom_no, "null"));
			chatInfo = chatInfoService.getChatInfo(chatInfo);
			webSocketHelper.setChatInfoMap(chatroom_no, chatMemberList);

		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}

		model.addAttribute("chatInfo", chatInfo);
		model.addAttribute("chatMemberList", chatMemberList);
		model.addAttribute("chatMessageList", chatMessageList);

		return "chat/chatroom";
	}
	
	// [temporary code]
	@RequestMapping(value = "getPublicChatList.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, List<ChatMessage>> getPublicChatList() {
		Map<String, List<ChatMessage>> publicChatListMap = new HashMap<String, List<ChatMessage>>();
		return publicChatListMap;
	}
}