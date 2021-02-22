package com.ezen.chord.chat.socketHelper;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.stereotype.Component;


@Component
public class WebSocketInterceptor implements ChannelInterceptor {

	@Autowired
	WebSocketHelper webSocketHelper;

	@Override
	public Message<?> preSend(Message<?> message, MessageChannel channel) {
		StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(message);
		Map<String, Object> httpSession = headerAccessor.getSessionAttributes();

		int mem_no = (Integer) httpSession.get("memNo");
		String socketId = (String) message.getHeaders().get("simpSessionId");

		if (StompCommand.CONNECT == headerAccessor.getCommand()) {

		} else if (StompCommand.SUBSCRIBE == headerAccessor.getCommand()) {
			String subscribe = (String) message.getHeaders().get("simpDestination");
			String[] addressList = subscribe.split("/");
			subscribe = addressList[3];
			int subscribe_key = Integer.parseInt(addressList[4]); 

			webSocketHelper.setSockMap(subscribe, socketId, mem_no, subscribe_key);

		} else if (StompCommand.DISCONNECT == headerAccessor.getCommand()) {
			webSocketHelper.removeSockMap(mem_no, socketId);
		}
		return message;
	}
}