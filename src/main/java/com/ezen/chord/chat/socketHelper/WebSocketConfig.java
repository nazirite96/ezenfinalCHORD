package com.ezen.chord.chat.socketHelper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

/**
 * WebSocket 및 STOMP 메시징 활성화
 * STOMP : pub/sub
 * pub : 메세지 공급 주체 ex) 집배원 
 * sub : 메세지 소비 주체 ex) 구독자
 * topic : ex) 우체통
 * 
 * STOMP의 Command : SEND, SUBSCRIBE를 지시
 */
@Configuration // 스프링 구성 클래스
@EnableWebSocketMessageBroker // 메시지 브로커가 지원하는 WebSocket 메시지 처리 활성화
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

   @Autowired
   WebSocketInterceptor webSocketInterceptor;

   @Override
   public void configureMessageBroker(MessageBrokerRegistry registry) {
      /**
       * 메세지브로커를 구성하는 기본 방법을 구현 하는 메소드 
       * 메세지브로커가 접두사가 붙은 대상에서 메시지를 클라이언트로 다시 전달할 수 있도록 호출
       * */
      
      // 메세지를 구독하는 요청의 prefix : '/'
      // enableSimpleBroker : 해당 경로로 SimpleBroker 등록
      // SimpleBroker : 해당 경로를 SUBSCRIBE하는 client에게 메세지 전달
      registry.enableSimpleBroker("/sub");

      // 메세지를 발행하는 요청의 prefix : client에서 SEND 요청 처리
      // 서버에서 client로부터의 메세지를 받을 prefix
      registry.setApplicationDestinationPrefixes("/pub");
   }

   @Override
   public void registerStompEndpoints(StompEndpointRegistry registry) {
      // STOMP WebSocket 연결 : 해당 EndPoint로 Handshake가 이뤄짐
      registry.addEndpoint("/socket").setAllowedOrigins("*").withSockJS().setInterceptors(new HttpSessionHandshakeInterceptor());
      
      // setAllowedOrigins("http://localhost:3000");
   }

   @Override
   public void configureClientInboundChannel(ChannelRegistration registration) {
      registration.interceptors(webSocketInterceptor);
   }
}