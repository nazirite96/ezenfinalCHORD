package com.ezen.chord.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ezen.chord.chat.dto.ChatInfo;
import com.ezen.chord.chat.service.ChatInfoService;
import com.ezen.chord.chat.service.ChatMessageService;

@Controller
public class ChatMessageController {

	@Autowired
	ChatInfoService chatInfoService;

	@Autowired
	ChatMessageService chatMessageService;

	// 변경
	// 메시지 전체 삭제 (intime 변경)
	@RequestMapping(value = "allDeleteChatMessage.do", method = RequestMethod.POST)
	public @ResponseBody int allDeleteChatMessage(@RequestBody ChatInfo chatInfo) {
		System.out.println("== allDeleteChatMessage 컨트롤러 ==");
		int reuslt = 0;
		try {
			// 채팅방 intime 시간 변경한다
			// chatinfo_deleted에 ('y'(채팅방나가기) 또는 'n'(메세지지우기)가 할당되어있고 그 값에 따라 xml에서 분기처리)
			reuslt = chatInfoService.allDeleteChatMessage(chatInfo);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return reuslt;
	}

	// 메시지 단일 삭제 (채팅메세지 update 처리)
	@RequestMapping(value = "deleteChatMessage.do", method = RequestMethod.POST)
	public @ResponseBody int deleteChatMessage(int chatMessage_no) {
		System.out.println("== allDeleteChatMessage 컨트롤러 ==");
		int reuslt = 0;
		try {
			// 채팅방 intime 시간 변경
			reuslt = chatMessageService.deleteChatMessage(chatMessage_no);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return reuslt;
	}
}