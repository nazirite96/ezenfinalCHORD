package com.ezen.chord.chat.socketHelper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;


@Configuration // 스프링 구성 클래스
@EnableWebSocketMessageBroker // 메시지 브로커가 지원하는 WebSocket 메시지 처리 활성화
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

   @Autowired
   WebSocketInterceptor webSocketInterceptor;

   @Override
   public void configureMessageBroker(MessageBrokerRegistry registry) {

      registry.enableSimpleBroker("/sub");


      registry.setApplicationDestinationPrefixes("/pub");
   }

   @Override
   public void registerStompEndpoints(StompEndpointRegistry registry) {

      registry.addEndpoint("/socket").setAllowedOrigins("*").withSockJS().setInterceptors(new HttpSessionHandshakeInterceptor());

   }

   @Override
   public void configureClientInboundChannel(ChannelRegistration registration) {
      registration.interceptors(webSocketInterceptor);
   }
}