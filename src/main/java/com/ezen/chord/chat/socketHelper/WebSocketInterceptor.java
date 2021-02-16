package com.ezen.chord.chat.socketHelper;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.stereotype.Component;

/** socket 연결, 비연결 관리 */
@Component
public class WebSocketInterceptor implements ChannelInterceptor {

   @Autowired
   WebSocketHelper webSocketHelper;

   @Override
   public Message<?> preSend(Message<?> message, MessageChannel channel) {
      StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(message);
      Map<String, Object> httpSession = headerAccessor.getSessionAttributes();

      
    		  
      String socketId = (String) message.getHeaders().get("simpSessionId");
      int mem_no = (Integer)httpSession.get("memNo");

      if (StompCommand.CONNECT == headerAccessor.getCommand()) {
         System.out.println("## CONNECT ##");
      } else if (StompCommand.SUBSCRIBE == headerAccessor.getCommand()) {
         System.out.println("## SUBSCRIBE ##");


         String subscribe = (String) message.getHeaders().get("simpDestination");
         String[] addressList = subscribe.split("/");
         subscribe = addressList[3]; // 회원의 주소 (login OR chat OR out)
         int subscribe_key = Integer.parseInt(addressList[4]); // 회원의 상세주소 (chatroom_no OR mem_no)

         webSocketHelper.setSockMap(subscribe, socketId, mem_no, subscribe_key);
         
      } else if (StompCommand.DISCONNECT == headerAccessor.getCommand()) {

    	  webSocketHelper.removeSockMap(mem_no,socketId);

      }	
      return message;
   }

   // 소켓연결 에러 : 서버가 구독을 성공적으로 만들 수없는 경우 서버는 클라이언트에게 ERROR프레임을 보낸 다음 연결을 닫아야한다.
}