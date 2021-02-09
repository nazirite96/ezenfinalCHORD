package com.ezen.chord.member.controller;

import java.util.Arrays;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.company.dto.CompanyDTO;
import com.ezen.chord.member.dto.MemberDTO;
import com.ezen.chord.member.service.MemberService;


@Controller
public class MemberController {

	@Autowired
	MemberService msvc;
	
	@Autowired
	JavaMailSender mailSender;
	
	private String randomNumber = random();
	
	//난수생성
	public String random() {
			
		int i=0;
		int j=0;
		int com[]=new int[6];
			
		for(i=0;i<com.length;i++) { //현재받은 숫자
			com[i]=(int)(Math.random()*9+1);
			for(j=0;j<i;j++) { //이미받은숫자를 담당
				if(com[i]==com[j]) {
					i--;
					break;
				}
			}
		}
		String str = "";
		for(i=0;i<com.length;i++) {
		str = Arrays.toString(com).replaceAll("[^0-9]","");
				
		}	
			
		return str;	
			
	}
	

	/****************************************************** 회원가입 **********************************************************/
	/*회원가입 form*/
	@RequestMapping("/memJoinForm.do")
	public String memJoinForm() {
		return "member/memJoinForm";
	}
	
	/*회원가입 이메일 중복 확인 form*/
	@RequestMapping("/emailChkForm.do")
	public String emailCheckForm(){
		return "member/memJoinEmailChkForm";
	}
	
	/*회원가입 이메일 중복 확인 기능*/
	@RequestMapping("/emailCheck.do")
	public ModelAndView emailCheck(String chkEmail) {
		
		System.out.println("controller: "+chkEmail);
		int result = msvc.join_mailChkService(chkEmail);
		ModelAndView mav = new ModelAndView();
	
		if(result>0) {
			mav.addObject("msg","사용중인 이메일 입니다.");
			mav.addObject("gopage","emailChkForm.do");
			mav.setViewName("member/memMsg");
	
		}else {
			mav.addObject("msg","사용가능 이메일"); // 빈칸일때도!!
			mav.addObject("email",chkEmail);
			mav.setViewName("member/memJoinMsg");
		
		}
		return mav;
	}
	
	/*인증번호 form*/
	@RequestMapping("/memJoinEmailSendForm.do")
	public ModelAndView memJoinEmailSendForm(MemberDTO dto) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("emailDto",dto);
		mav.setViewName("member/memJoinEmailSendForm");
		
		return mav;
	}
	
	/*인증번호 메일 보내기 기능*/
	@RequestMapping("/memJoinEmailSend.do")
	public ModelAndView mailSend(HttpServletRequest req) {
		
		String setfrom = "choongyeon0101@gmail.com";
		String senderName = "chord_관리자";
		String toMail = req.getParameter("mem_email"); //받는사람
		String subject = "chord 안내 메일 입니다."; //제목
		String contents = "가입해주셔서 감사합니다.chord 인증번호: "+randomNumber ;//내용
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			
			messageHelper.setFrom(setfrom,senderName);
			messageHelper.setTo(toMail);
			messageHelper.setSubject(subject);
			messageHelper.setText(contents);
			
			mailSender.send(message);

			
		} catch (Exception e) {
			System.out.println("mailController 에러:"+e.getMessage());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg","이메일 보내기 성공");
		mav.setViewName("member/memJoinEmailMsg");
		return mav;
	}
	
	/*회원가입 기능*/
	@RequestMapping("/memJoin.do")
	public ModelAndView signUp(MemberDTO dto,String checkNum) {
		
		ModelAndView mav = new ModelAndView();
		
		if(randomNumber.equals(checkNum)) {
			
			int result = msvc.join_memJoinFunctionService(dto);
			String msg = result>0?dto.getMem_name()+"님 회원가입 축하합니다!":"회원가입 실패!";
			
			mav.addObject("msg",msg);
			mav.addObject("getEmail",dto.getMem_email()); //회원가입 한 사람의 이름
			mav.setViewName("company/companyChooseForm"); //회사 고르는 페이지 이동

		}else if(checkNum.equals("") || checkNum==null){
			
			String msg = "인증번호를 기입해주세요.";
			mav.addObject("msg",msg);
			mav.setViewName("member/memJoinEmailMsg");
			
		}else {
			String msg = "틀린 번호 입니다. 다시 입력해주세요.";
			mav.addObject("msg",msg);
			mav.setViewName("member/memJoinEmailMsg");
		}
		
		return mav;
	}
	
	
	
	

	
	
	
	/****************************************************** 로그인 **********************************************************/
	/*로그인 form*/
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}
	
	/*로그인 기능*/
	@RequestMapping("/login.do")
	public ModelAndView login(MemberDTO mdto,HttpSession session,String ckbx,HttpServletResponse resp) {

		ModelAndView mav = new ModelAndView();
		
		int login_emailResult = msvc.login_EmailChkService(mdto.getMem_email()); //이메일이 있는지?
		
		if(login_emailResult>0) { // 해당 이메일이 있다면,
			
			int login_pwdResult = msvc.login_PwdChkSevice(mdto); //패스워드가 맞는지?
			
			if(login_pwdResult>0) { // 이메일+패스워드 모두 맞음
				
				String grade_type = msvc.login_getGradeService(mdto.getMem_email()); //관리자 타입 가져오기
				if(grade_type.equals("company")) { // 회사관리자라면,
					session.setAttribute("grade", "com_ses"); 
				}else if(grade_type.equals("website")) { // 사이트 관리자라면,
					session.setAttribute("grade", "web_ses");
				}else { //관리자가 아니라면
					System.out.println("일반회원!!!");
				}
				
				MemberDTO userInfo = msvc.login_GetUserInfoService(mdto.getMem_email()); // 해당 회원 정보 가져오기
				
				String userName = userInfo.getMem_name();//이름가져오기
				int userNo = userInfo.getMem_no();//멤버넘버가져오기
				String userEmail = userInfo.getMem_email(); // 이메일가져오기
				int userComNo = userInfo.getCom_no();//회사넘버가져오기
				
				CompanyDTO comInfo = msvc.login_getComPwdService(userComNo);//회사비밀번호가져오기
				String comPwd = comInfo.getCom_pwd();
				
				msvc.login_userLogDataService(userNo);//로그인 기록 insert
				
				/*쿠키 생성*/
				if(ckbx!=null) { //체크됐다면
					Cookie ck = new Cookie("saveEmail",userEmail);
					ck.setMaxAge(60*60*24*7);
					resp.addCookie(ck);
				}else {
					Cookie ck = new Cookie("saveEmail",userEmail);
					ck.setMaxAge(0);
					resp.addCookie(ck);
				}
				
				/*세션 생성*/
				session.setAttribute("name", userName);
				session.setAttribute("memNo", userNo);
				session.setAttribute("comNo", userComNo);
				session.setAttribute("comPwd", comPwd);
				
				mav.addObject("msg",userName+"님 환영합니다!");
				mav.addObject("gopage","index.do");
				
				
			}else { // 이메일은 맞지만, 패스워드 틀림
				mav.addObject("msg","이메일과 비밀번호를 확인해주세요");
				mav.addObject("gopage","loginForm.do");
			}
				
		}else { //이메일 틀림
			
			mav.addObject("msg","회원가입 해주세요");
			mav.addObject("gopage","loginForm.do");
			
		}
		
		mav.setViewName("member/memMsg");
		return mav;
	}
	
	
	/*로그아웃*/
	@RequestMapping("/logout.do") 
	public ModelAndView logout(HttpSession session) {
		
		String msg = "로그아웃 하시겠습니까?";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("gopage","index.do");
		
		session.invalidate();
		//redirect:index.do
		mav.setViewName("member/memMsg");
		
		return mav;
	}
	
	/******************************************* 마이 페이지 *******************************************/
	
	/*마이페이지*/
	@RequestMapping("/goMyPage.do")
	public ModelAndView myPage(int mem_no) {
		MemberDTO memResult = msvc.myPageService(mem_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memResult",memResult);
		mav.setViewName("member/myPageForm");
		
		return mav;
		
	}
	
	/*마이페이지 내 정보 수정*/
	@RequestMapping("/memUpdate.do")
	public ModelAndView myPageUpdate(MemberDTO mdto) {
		
		int result = msvc.myPageUpdateService(mdto);
		String msg = result>0?"성공적으로 업데이트 되었습니다.":"업데이트에 실패했습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("mem_no",mdto.getMem_no());
		mav.addObject("gopage","goMyPage.do?mem_no="+mdto.getMem_no());
		mav.setViewName("member/memMsg");
		
		return mav;
	}

	
}

