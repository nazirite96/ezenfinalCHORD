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

	@RequestMapping(value = "allDeleteChatMessage.do", method = RequestMethod.POST)
	public @ResponseBody int allDeleteChatMessage(@RequestBody ChatInfo chatInfo) {

		int reuslt = 0;
		try {

			reuslt = chatInfoService.allDeleteChatMessage(chatInfo);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return reuslt;
	}

	@RequestMapping(value = "deleteChatMessage.do", method = RequestMethod.POST)
	public @ResponseBody int deleteChatMessage(int chatMessage_no) {

		int reuslt = 0;
		try {

			reuslt = chatMessageService.deleteChatMessage(chatMessage_no);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return reuslt;
	}
}