package controller;


import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.MyConstant;
import dao.MemberDao;
import util.Paging;
import vo.MemberVo;

@Controller
@RequestMapping("/member/")
public class MemberController {

   @Autowired
   HttpSession session;
   
   @Autowired
   HttpServletRequest request;
   
   @Autowired
   ServletContext application;
   
   MemberDao member_dao;

   public void setMember_dao(MemberDao member_dao) {
      
	   this.member_dao = member_dao;
   }
   
   
   	//관리자페이지 멤버전체조회
      @RequestMapping("member_mypage_adm.do")
      public String list(@RequestParam(value="page", required = false, defaultValue = "1") int nowPage,
      					  @RequestParam(value="search", required = false, defaultValue = "member_all") String search,         
      					  @RequestParam(value="search_text", required = false) String search_text,           
      					  Model model) {
   	   
   	  int start = (nowPage-1) * MyConstant.Member.BLOCK_LIST + 1;
   	  int end = start + MyConstant.Member.BLOCK_LIST - 1;
   	  
   	  	 Map map = new HashMap();
         map.put("start", start);
         map.put("end", end);
         
         
         //전체검색이 아니면 검색조건주기
         if(!search.equals("member_all")) {
            
            if(search.equals("grade_idx_mem_regdate")) { //등급+가입일자
               
                  map.put("grade_idx", search_text);
                  map.put("mem_regdate", search_text);
                  
            } else if(search.equals("grade_idx")) {//등급
               
               map.put("grade_idx", search_text);
               
            } else if(search.equals("mem_regdate")) {//가입일자
               
               map.put("mem_regdate", search_text);
            
            } 
               
         }
       
         //전체게시물 수 구하기
         int rowTotal = member_dao.selectRowTotal(map);
         
         String search_filter = String.format("search=%s&search_text=%s", search, search_text);
         
         String pageMenu = Paging.getPaging("member_mypage_adm.do",
                                     search_filter, 
                                     nowPage, 
                                     rowTotal, 
                                     MyConstant.Member.BLOCK_LIST, 
                                     MyConstant.Member.BLOCK_PAGE);
         
         List<MemberVo> list = member_dao.selectConditionList(map);
         
         model.addAttribute("list",list);
         model.addAttribute("pageMenu", pageMenu);
      
         return "member/member_mypage_adm";
         
      }
      
   
   @RequestMapping("login.do")
   @ResponseBody
   public Map login(String mem_email,String mem_pwd)
   {   
      
      MemberVo user = member_dao.selectOne(mem_email);
      
      //mem_email 체크
      
      Map map = new HashMap();
      if(user==null) {
         
      
         map.put("result", "fail_email");
         return map;
      }
      
      if(user.getMem_pwd().equals(mem_pwd)==false) {
      
      
         map.put("result", "fail_pwd");
         return map;
      }
   
      session.setAttribute("user", user);
      
      map.put("mem_nickname",user.getMem_nickname());
      map.put("grade_idx", user.getGrade_idx());
      map.put("result", "success");
      return map;
      
   }
   
   //로그인 폼
   @RequestMapping("insert_form.do")
   public String login_form() {
      
      return "member/member_signup_form";
   }
   
   
   
   @RequestMapping("delete.do")
   public String delete(int mem_idx) {
      int res = member_dao.delete(mem_idx);
      
      return "redirect:list.do";
      
   }
   
   //http://localhost:9090/camping/member/insert.do?mem_pic_filename=&mem_email=gksrlfaldud%40naver.com&mem_pwd=1234&mem_nickname=%EA%B0%90%EC%9E%90%EB%A7%81&mem_birth=19961224&mem_profile=%EC%9E%98+%EB%B6%80%ED%83%81%ED%95%A9%EB%8B%88%EB%8B%B9
   
   @RequestMapping("insert.do")
   public String insert(MemberVo vo ,@RequestParam MultipartFile mem_pic,Model model) throws Exception {
      
      System.out.println(vo);
      //업로드 위치 
      String web_path ="/resources/upload/";
      String abs_path = application.getRealPath(web_path);
      
      String p_filename ="no_file";
      
      if(!mem_pic.isEmpty()) {//업로드된 파일이 있다면
      
      p_filename = mem_pic.getOriginalFilename();   
         
      File f =new File(abs_path,p_filename);
      
      if(f.exists()) {//동일 파일명이 존재하면 이름 바꾸기 
         
         long time = System.currentTimeMillis();
         
         p_filename = String.format("%d_%s", time,p_filename);
         
         f = new File(abs_path,p_filename);
         
         
      }
         //임시저장 파일 ->F로 복사해 온다 
         mem_pic.transferTo(f);
      
      
      }
      
      vo.setMem_pic_filename(p_filename);
      
      String mem_profile =vo.getMem_profile().replaceAll("\r\n", "<br>");
      vo.setMem_profile(mem_profile);
      vo.setGrade_idx(1);
      vo.setMem_status(0);
      
      
      
      int res = member_dao.insert(vo);
       
      
      model.addAttribute("join_success","join_success");
      
      return "redirect:../";
   }
   
   @RequestMapping("check_email.do")
   @ResponseBody
   public String check_email(String mem_email) {
      
      MemberVo vo = member_dao.selectOne(mem_email);
      System.out.println(vo);
      boolean bResult =false;
      if(vo==null)bResult =true;
      
      JSONObject json = new JSONObject();
      json.put("result", bResult);
      
      String json_str =json.toJSONString();
      
      return json_str;
   }
   
   @RequestMapping("check_nickname.do")
   @ResponseBody
   public String check_nickname(String mem_nickname) {
      
      MemberVo vo = member_dao.selectOne1(mem_nickname);
      
      boolean bResult =false;
      if(vo==null)bResult =true;
      
      JSONObject json = new JSONObject();
      json.put("result_nickname", bResult);
      
      String json_str =json.toJSONString();
      
      return json_str;
   }
   
   @RequestMapping("logout.do")
   public String logout() {
      
      session.removeAttribute("user");
      
      return "redirect:../";
   }
   
   @RequestMapping("mypage/my_page.do")
   public String mypage(Model model) {
      MemberVo user=null;
      if((user=(MemberVo) session.getAttribute("user"))==null) {
         
         model.addAttribute("reson", "session_timeout");
         return "redirect:login_form.do";
      }
      
      int likeCount = member_dao.selectOne_like_count(user.getMem_idx());
      int replyCount = member_dao.selectOne_reply_count(user.getMem_idx());
      int categoryCount = member_dao.selectOne_category_count(user.getMem_idx());
      int replyLikeCount    = member_dao.selectOne_reply_like_count(user.getMem_idx());

      
      model.addAttribute("likeCount", likeCount);
      model.addAttribute("replyCount", replyCount);
      model.addAttribute("categoryCount",categoryCount);
<<<<<<< HEAD
      
      
=======
      model.addAttribute("replyLikeCount",replyLikeCount);

>>>>>>> fcb832d0bce3c60d0e5af6703ee95c9f77bae045
      return "mypage/my_page";
   }
   
   @RequestMapping("mypage/my_profile_page.do")
   public String my_profile_page(Model model) {
      
      
      /*
       * MemberVo user=null;
       * 
       * if((user=(MemberVo) session.getAttribute("user"))==null) {
       * 
       * model.addAttribute("reson", "session_timeout"); return
       * "redirect:login_form.do"; }
       */
      
         
      return "mypage/my_profile_page";
   }
   
   @RequestMapping("mypage/modify.do")
   public String member_update(MemberVo vo,Model model) {
      
      /*
       * MemberVo user=null;
       * 
       * 
       * if((user=(MemberVo) session.getAttribute("user"))==null ) {
       * 
       * model.addAttribute("reson", "session_timeout"); return
       * "redirect:login_form.do";
       * 
       * }
       */
       
    
      String mem_profile =vo.getMem_profile().replaceAll("\r\n", "<br>");
      vo.setMem_profile(mem_profile);
      System.out.println(vo);
      
      int res =member_dao.member_update(vo);
      MemberVo user1 = member_dao.selectOne(vo.getMem_idx());
      
      session.removeAttribute("user");
      session.setAttribute("user", user1);
       
      return "redirect:my_page.do";
    
   }
   
   
   @RequestMapping("mypage/photo_upload.do")
   @ResponseBody
   public String photo_upload(int mem_idx,@RequestParam MultipartFile mem_pic,Model model) throws Exception {
      
     
      
      //업로드 위치 
      String web_path ="/resources/upload/";
      String abs_path = application.getRealPath(web_path);
      
      
   
      
      MemberVo originVo = member_dao.selectOne(mem_idx);
      File deleteFile = new File(abs_path,originVo.getMem_pic_filename());
      deleteFile.delete();
      
      
      String p_filename ="no_file";
      
      if(!mem_pic.isEmpty()) {//업로드된 파일이 있다면
         
         p_filename = mem_pic.getOriginalFilename();   
         
         File f =new File(abs_path,p_filename);
         
         if(f.exists()) {//동일 파일명이 존재하면 이름 바꾸기 
            
            long time = System.currentTimeMillis();
            
            p_filename = String.format("%d_%s", time,p_filename);
            
            f = new File(abs_path,p_filename);
            
            
         }
         // 임시저장 파일 -> f로 복사해 온다 
         mem_pic.transferTo(f);
         
      }
      
      
      MemberVo vo = new MemberVo();
      vo.setMem_pic_filename(p_filename);
      vo.setMem_idx(mem_idx);
   
      
      
      
      int res =member_dao.photo_upload(vo);
     
      
      JSONObject json =new JSONObject();
      json.put("p_filename", p_filename);
      
      String json_str = json.toJSONString();
      
      return json_str;
      
   }
   
   
   
   
   
   
   
   @RequestMapping("mypage/member_out")
   public String member_out( int mem_idx){
      
      System.out.println(mem_idx);
      
      MemberVo vo = new MemberVo();
      vo.setMem_status(0);
      vo.setMem_idx(mem_idx);
      
      int res = member_dao.member_out(vo);
      
      return "redirect:/";
   }
      
     
      
   
   
}
