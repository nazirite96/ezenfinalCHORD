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

		MemberDTO member = new MemberDTO();
		int mem_no = (Integer) session.getAttribute("memNo");
		String mem_name = (String) session.getAttribute("name");
		int com_no = (Integer) session.getAttribute("comNo");

		member.setMem_name(mem_name);
		member.setMem_no(mem_no);
		member.setCom_no(com_no);

		List<ChatMessage> privateChatList = new ArrayList<ChatMessage>(); // 개인 채팅방 목록을 담을 List 생성
		List<ChatMessage> publicChatList = new ArrayList<ChatMessage>(); // 단체 채팅방 목록을 담을 List 생성

		try {
			privateChatList = chatMessageService.getPrivateChatList(member);
			publicChatList = chatMessageService.getPubChatroomList(member.getMem_no());
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}

		// DB 조회 결과값을 chatListMap에 Put
		Map<String, List<ChatMessage>> chatListMap = new HashMap<String, List<ChatMessage>>();
		chatListMap.put("privateChatList", privateChatList);
		chatListMap.put("publicChatList", publicChatList);

		return chatListMap;
	}

	// ** 변경 ***//
	// 채팅방 생성
	@RequestMapping(value = "createChatroom.do", method = RequestMethod.POST)
	public @ResponseBody int createChatroom(ChatInfo chatinfo) {

		int myMem_no = (Integer) session.getAttribute("memNo"); // 내 mem_no
		String myMem_name = (String) session.getAttribute("name"); // 내 mem_name = chatInfo_roomname
		int yourMem_no = chatinfo.getMem_no(); // 상대방 mem_no
		String yourMem_name = chatinfo.getMem_name(); // 상대방 mem_name = chatInfo_roomname

		List<ChatInfo> memberList = new ArrayList<ChatInfo>();
		int chatroom_no = 0;

		Chatroom chatroom = new Chatroom();

		try {

			if (chatinfo.getMemberList().size() >= 3) {
				chatroom.setChatroom_type(1);
				chatroom_no = chatroomService.createChatroom(chatroom);
				for (Integer mem_no : chatinfo.getMemberList()) {
					memberList.add(new ChatInfo(mem_no, chatroom_no, chatinfo.getChatInfo_roomname()));
				}
				webSocketHelper.setNewChatroomList(chatroom_no); // stomp컨트롤러에서 사용 : 채팅방의 상태에 따른 분기처리
				// 개인방 생성
			} else {

				chatroom_no = chatInfoService.checkChatroom(myMem_no, yourMem_no);
				if (chatroom_no != 0) {
					return chatroom_no;
				}
				chatroom.setChatroom_type(0);
				chatroom_no = chatroomService.createChatroom(chatroom);

				memberList.add(new ChatInfo(myMem_no, chatroom_no, yourMem_name));
				memberList.add(new ChatInfo(yourMem_no, chatroom_no, myMem_name));

			}
			chatInfoService.setChatInfo(memberList);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return chatroom_no;
	}

	// 채팅방 진입
	@RequestMapping(value = "chatroom.do", method = RequestMethod.POST)
	public String chatroom(@RequestParam("chatroom_no") int chatroom_no, Model model) {

		int myMem_no = (Integer) session.getAttribute("memNo"); // 내 mem_no

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

	// ** [temporary code- Additional part] ***//
	// invitationPopup.jsp Member List
	@RequestMapping(value = "invitationPopup.do", method = RequestMethod.GET)
	public String invitationPopUp(Model model) {

		MemberDTO member = new MemberDTO();
		int mem_no = (Integer) session.getAttribute("memNo");
		String mem_name = (String) session.getAttribute("name");
		int com_no = (Integer) session.getAttribute("comNo");

		member.setMem_name(mem_name);
		member.setMem_no(mem_no);
		member.setCom_no(com_no);

		List<MemberDTO> invitationMemberList = new ArrayList<MemberDTO>();
		try {
			invitationMemberList = chatInfoService.getInvitationMemberList(member);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		model.addAttribute("invitationMemberList", invitationMemberList);
		return "chat/invitationPopup";
	}
}