package com.ezen.chord.company.controller;

import java.util.HashMap;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.company.dao.CompanyDAO;
import com.ezen.chord.company.dto.CompanyDTO;
import com.ezen.chord.company.service.CompanyService;
import com.ezen.chord.member.dto.MemberDTO;


@Controller
public class CompanyController {

	@Autowired
	CompanyService csvc;

	@Autowired
	CompanyDAO dao;


	/*회사 test form*/
	@RequestMapping("/testForm.do")
	public String existingCompanyForm() { 
		return "company/comTestForm";
	}
	
	/**************************************************************************/

	/*기존 회사 출입 비밀번호 입력 form*/
	@RequestMapping("/exComPwdInputForm.do")
	public ModelAndView exComPwdInputForm(String hiddenEmail) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("emailData",hiddenEmail);
		mav.setViewName("company/existComPwdForm");

		return mav;

	}

	/*기존 회사 출입 비밀번호 확인 기능*/
	@RequestMapping("/exComPwd.do")
	public ModelAndView exComPwd(CompanyDTO cdto,MemberDTO mdto,HttpSession session) { //출입하면서 동시에 로그인되도록!

		ModelAndView mav = new ModelAndView();		

		int com_no_result = csvc.exComNoChkService(cdto.getCom_no());// 번호가 있는지?
		if(com_no_result>0) { // 해당 번호가 있다면,
			int com_pwd_result = csvc.exComPwdChkService(cdto);// 패스워드가 맞는지?

			if(com_pwd_result>0) { // 번호+패스워드 모두 맞음

				csvc.exComNoUpdateService(mdto);// com_no 업데이트해주기
				//인설트 일반

				mav.addObject("msg","입사 성공~");
				mav.addObject("gopage","testForm.do");
				
				/*자동 로그인 기능*/
				String userName = csvc.comGetNameService(mdto.getMem_email()); // 해당 회원 이름 가져오기
				/*세션 생성*/
				session.setAttribute("name",userName);
				session.setAttribute("email", mdto.getMem_email());	


			}else { // 번호는 맞지만, 패스워드 틀림
				mav.addObject("msg","번호를 다시 입력해주세요.");
				mav.addObject("gopage","exComPwdInputForm.do" );
			}

		}else { //번호 틀림

			mav.addObject("msg","번호를 다시 입력해주세요.");
			mav.addObject("gopage","exComPwdInputForm.do");

		}

		mav.setViewName("company/comMsg");
		return mav;

	}

	
	/*새 회사 설정 form*/
	@RequestMapping("/makeNewCompanyForm.do")
	public ModelAndView makeNewComForm(String hiddenEmail) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("hiddenEmail",hiddenEmail);
		mav.setViewName("company/newComMakeForm");

		return mav;
	}


	/*새 회사 설정 기능*/
	@RequestMapping("/makeNewCompany.do")
	public ModelAndView makeNewCompany(CompanyDTO cdto,String mem_email) {

		int build_com = csvc.buildCompanyService(cdto);
		
		ModelAndView mav = new ModelAndView();
		String msg = "";
		if(build_com>0) {
			msg = "["+cdto.getCom_name()+"] 설립을 축하합니다!";

		}else {
			msg = "회사 설립 실패!";

		}

		mav.addObject("getMemEmail",mem_email);
		mav.addObject("getComName",cdto.getCom_name());
		mav.addObject("msg",msg);
		mav.setViewName("company/newComStart");

		return mav;
	}

	
	/*새로운 회사 설정 후 시작*/
	@RequestMapping("/startChord.do")
	public String start_chord(MemberDTO mdto,String mem_email,String com_name,HttpSession session) {

		int getComNo_result = csvc.findComNoService(com_name); //com_no 찾음.
		mdto.setCom_no(getComNo_result); //com_no setting해주기
		csvc.exComNoUpdateService(mdto); //해당 멤버에 com_no 업데이트해주기
			
		
		int getMemNo_result = csvc.findMemNoService(mem_email);// 해당멤버position 업데이트해주기 위해 해당 멤버no찾기
		System.out.println("controller 회사넘버:"+getComNo_result + "/ 멤버넘버: "+getMemNo_result);
		
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("kind_no", getComNo_result);
		map.put("mem_no", getMemNo_result);
		csvc.newPositionInsertService(map); // position 업데이트해주기 grade update

		
		/*자동 로그인 기능*/
		String userName = csvc.comGetNameService(mdto.getMem_email()); // 해당 회원 이름 가져오기
		/*세션 생성*/
		//session.setAttribute("name",userName);
		//session.setAttribute("email", mem_email);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("");
		

		return "member/loginForm";
		//return mav;
	}
	
	

}
