package com.ezen.chord.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.admin.service.AdminService;
import com.ezen.chord.company.dto.CompanyDTO;
import com.ezen.chord.files.service.FilesService;
import com.ezen.chord.member.dto.MemberDTO;
import com.ezen.chord.project.service.ProjectService;

@Controller
public class AdminController {

	@Autowired
	AdminService asvc;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	ProjectService proService;
	
	@Autowired
	FilesService fileService;

	/*사이트 운영자 접속 통계*/
	@RequestMapping("/adminWebForm.do")
	public ModelAndView adminWebForm() {

    
		List<Map<String, Object>> userLogList = asvc.adminLogDataService();
		
		
		//결과가져오기
		String result = null;
		for(int i=0;i<userLogList.size();i++) {
			if(result!=null) {
				result +=",";
			}else if(result==null) {
				result="";
			}
			result += " ['"+userLogList.get(i).get("NAME").toString()+"',"+userLogList.get(i).get("CNT")+"] ";
		}

		
        ModelAndView mav = new ModelAndView();
        mav.addObject("userLogList",userLogList);
        mav.addObject("result",result);
        mav.setViewName("adminWeb/adminWebForm");
  
   
		return mav;
	}
	
	/*사이트 운영자 파일 다운 이력*/
	@RequestMapping("/adminFileForm.do")
	public ModelAndView adminFileData() {

		List<Map<String, Object>> fileList = asvc.adminFileListService();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("fileList",fileList);
		mav.setViewName("adminWeb/adminFileList");
		
		return mav;
		
	}
	
	
	/*회사관리자 _회사정보form*/
	@RequestMapping("/adminCompanyForm.do")
	public ModelAndView adminCompanyForm(int com_no) {
		CompanyDTO comResult = asvc.adminComUpdateFormService(com_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("comResult",comResult);
		mav.setViewName("adminCom/adminComForm");
		
		return mav;
	}
	
	
	/*회사관리자_회사정보수정*/
	@RequestMapping("/adminComUpdate.do")
	public ModelAndView adminComUpdate(CompanyDTO cdto) {
		
		int comResult = asvc.adminComUpdateService(cdto);
		String msg = comResult>0?"성공적으로 업데이트 되었습니다.":"업데이트에 실패했습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("com_no",cdto.getCom_no());
		mav.addObject("gopage","adminCompanyForm.do?com_no="+cdto.getCom_no());
		mav.setViewName("adminCom/adminMsg");
		
		return mav;
	}
	
	/*회사 관리자_회원초대 form*/
	@RequestMapping("/adminMailSendForm.do")
	public ModelAndView adminMailSendForm(HttpServletRequest req) {
		String com_no = req.getParameter("com_no");
		String com_pwd = req.getParameter("com_pwd");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("com_no",com_no);
		mav.addObject("com_pwd",com_pwd);
		mav.setViewName("adminCom/adminMailSend");
		return mav;
	}
	
	/*회사 관리자_회원초대 기능*/
	@RequestMapping("/adminMailSend.do")
	public ModelAndView adminMailSend(HttpServletRequest req) {
		
		String com_no = req.getParameter("com_no");
		String com_pwd = req.getParameter("com_pwd");
		
		String setfrom = "choongyeon0101@gmail.com";
		String senderName = "chord";
		String toMail = req.getParameter("receiveMail"); //받는사람
		String subject = "chord 회사 초대 메일입니다."; //제목
		String contents = "회사 비밀번호 앞자리[ "+com_no+" ] 뒷자리[ "+com_pwd+" ] 입니다.";//내용 
		
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
		mav.addObject("gopage","adminMailSendForm.do?com_no="+com_no+"&com_pwd="+com_pwd);
		mav.setViewName("adminCom/adminMsg");
		
		return mav;
		
		
	}
	
	/*회사관리자 _ 회원관리 리스트*/
	@RequestMapping(value="/adminMemManagementForm.do")
	public ModelAndView adminMemManagementForm(int com_no) {
	
		List<Map<String, Object>> memList = asvc.adminMemListService(com_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memList",memList);
		mav.setViewName("adminCom/adminMemManagementForm");
		return mav;
	}
	
	/*회사 관리자_ 멤버 정보*/
	@RequestMapping(value="/adminMemContents.do",produces="text/plain;charset=utf-8")
	public ModelAndView adminMemContents(@RequestParam(value="com_no",defaultValue = "0")int com_no,@RequestParam(value="mem_no",defaultValue = "0")int mem_no) {
			
		ModelAndView mav = new ModelAndView();
		
		List<Map<String, Object>> list = asvc.adminMemContentsService(mem_no);
	
		mav.addObject("list",list);
		mav.setViewName("adminCom/adminMemContents");
		return mav;
	}
	
	/*회사관리자_멤버 관리자변경*/
	@RequestMapping("/adminChange.do")
	public ModelAndView adminChange(MemberDTO dto,String memGrade) {
		
		if(memGrade.equals("company") || memGrade=="company") {
			asvc.adminPositionDeleteService(dto.getMem_no()); // 관리자 권한 delete
			
		}else if(memGrade==null || memGrade.equals("")) {
			Map<String,Integer> map = new HashMap<String,Integer>();
			map.put("kind_no", dto.getCom_no());
			map.put("mem_no", dto.getMem_no());
			asvc.adminPositionInsertService(map);// position 업데이트해주기 grade insert
			
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg","변경완료!");
		mav.addObject("gopage","adminMemManagementForm.do?com_no="+dto.getCom_no()); // 회원목록
		mav.setViewName("adminCom/adminMemConMsg");
		
		return mav;
	}
	
	/*멤버 정보 수정하기*/
	@RequestMapping("/adminMemInfoChange.do")
	public ModelAndView adminMemInfoChange(Integer com_no,Integer mem_no,Integer mem_info_no,String mem_info_position,String mem_info_dept) {
		
		int info_result = 0;
		MemberDTO mdto = new MemberDTO();
		if(mem_info_no==null || mem_info_no==0) {
			mdto.setMem_info_position(mem_info_position);
			mdto.setMem_info_dept(mem_info_dept);
			mdto.setMem_no(mem_no);
			
			info_result = asvc.adminMemInfoInsertService(mdto);//member info insert
		}else if(mem_info_no!=0 || mem_info_no!=null) {
			mdto.setMem_info_position(mem_info_position);
			mdto.setMem_info_dept(mem_info_dept);
			mdto.setMem_no(mem_no);
			info_result = asvc.adminMemInfoUpdateService(mdto);//member info update 
		}
		
		String msg = info_result>0?"성공적으로 업데이트 되었습니다.":"업데이트에 실패했습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("gopage","adminMemManagementForm.do?com_no="+com_no); // 회원목록
		mav.setViewName("adminCom/adminMemConMsg");
		
		return mav;
		
		
	}
	
	
	/*회사관리자_프로젝트 목록보기*/
	@RequestMapping("/adminProListForm.do")
	public ModelAndView adminProjectList(@RequestParam(value="cp",defaultValue = "1")int cp,Integer com_no,HttpSession sess) {

		if(com_no==null) {
			com_no = (Integer)sess.getAttribute("comNo");
		}
		
		int totalCnt = asvc.adminTotalCntService(com_no);
		int listSize = 5;
		int pageSize = 3;
		
		String pageStr = com.ezen.chord.page.PageModule.makePage("adminProListForm.do", cp, totalCnt, listSize, pageSize);
		
		List<Map<String, Object>> list = asvc.adminProjectListService(cp,listSize,com_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("prolist",list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("adminCom/adminProListForm");

		
		return mav;
	}
	
	/*회사관리자_프로젝트 상세 내용보기*/
	@RequestMapping(value="/adminProContents.do",produces="text/plain;charset=utf-8")
	public ModelAndView adminProContents(int pro_no) {
		
		List<Map<String, Object>> nameList = asvc.adminProInfoService(pro_no); // 이름가져오기
		List<Map<String, Object>> prolist = asvc.adminProContentsService(pro_no);
	
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("name",nameList);
		mav.addObject("proContents",prolist);
		mav.setViewName("adminCom/adminProContents");
		
		
		return mav;
	}

	
	/*회사관리자_프로젝트 삭제*/
	@RequestMapping("/adminProDelete.do")
	public ModelAndView adminProDelete(HttpSession sess,int pro_no,String pro_name){
		
		int com_no = (int)(sess.getAttribute("comNo"));
		System.out.println(pro_no +"/"+ pro_name +"/" + com_no);

		
		proService.deletePro(pro_no);
		//fileService.delProfolder(pro_name);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg","프로젝트 삭제되었습니다.");
		mav.addObject("gopage","adminProListForm.do?com_no"+com_no);
		mav.setViewName("adminCom/adminMemConMsg");
		return mav;
		
	}
	
	
}
