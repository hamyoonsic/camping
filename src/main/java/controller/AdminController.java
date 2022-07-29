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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.MyConstant;
import dao.CarpoolDao;
import dao.GradeDao;
import dao.MarketDao;
import dao.MemberDao;
import dao.ReviewDao;
import util.Paging;
import vo.CarpoolVo;
import vo.MarketVo;
import vo.MemberVo;
import vo.ReviewVo;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	ServletContext applicaton;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	

    @Autowired
    ServletContext application;
	
	CarpoolDao carpool_dao;

	public void setCarpool_dao(CarpoolDao carpool_dao) {
		this.carpool_dao = carpool_dao;
	}
	
	MarketDao market_dao;
	
	public void setMarket_dao(MarketDao market_dao) {
		this.market_dao = market_dao;
	}
	
	ReviewDao review_dao;

	public void setReview_dao(ReviewDao review_dao) {
		this.review_dao = review_dao;
	}
	
	MemberDao member_dao;

	public void setMember_dao(MemberDao member_dao) {
		this.member_dao = member_dao;
	}
	
	GradeDao grade_dao;
	
	
	
	public void setGrade_dao(GradeDao grade_dao) {
		this.grade_dao = grade_dao;
	}


	// 관리자 페이지 불러오기
	@RequestMapping("admin_page.do")
	public String list() {

		return "admin/admin_page";
	}

	// 카풀 게시판 조회
	@RequestMapping("carpool_list.do")
	public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int nowPage,
			@RequestParam(value = "search", required = false, defaultValue = "carpool_all") String search,
			@RequestParam(value = "search_text", required = false) String search_text, Model model) {

		int m_idx = 0;

		MemberVo user = (MemberVo) session.getAttribute("user");
		int start = (nowPage - 1) * MyConstant.Admin.BLOCK_LIST + 1;
		int end = start + MyConstant.Admin.BLOCK_LIST - 1;
		if (user != null)
			m_idx = user.getMem_idx();

		//세션에 저장되어있는 Show정보를 삭제한다.
		session.removeAttribute("show");

		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("m_idx", m_idx);

		//전체검색이 아니면 검색조건주기
		if (!search.equals("carpool_all")) {

			if (search.equals("carpool_title_carpool_content_mem_nickname")) { // 제목+이름+내용

				map.put("carpool_title", search_text);
				map.put("carpool_content", search_text);
				map.put("mem_nickname", search_text);

			} else if (search.equals("carpool_title")) {// 제목

				map.put("carpool_title", search_text);

			} else if (search.equals("carpool_content")) {// 내용

				map.put("carpool_content", search_text);

			} else if (search.equals("mem_nickname")) {// 닉네임

				map.put("mem_nickname", search_text);
			}

		}

		//전체게시물 수 구하기
		int rowTotal = carpool_dao.selectRowTotal(map);

		String search_filter = String.format("search=%s&search_text=%s", search, search_text);

		String pageMenu = Paging.getPaging("carpool_list.do", 
											search_filter, 
											nowPage, 
											rowTotal,
											MyConstant.Admin.BLOCK_LIST, 
											MyConstant.Admin.BLOCK_PAGE);

		List<CarpoolVo> list = carpool_dao.selectConditionList(map);

		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);

		return "admin/admin_carpool";
	}

	  //카풀게시판 글보기
	   @RequestMapping("/board/carpool_view.do")
	   public String carpool_view(int carpool_idx,Model model) {
	      
	      //b_idx에 해당되는 게시물 정보 얻어온다 
	      CarpoolVo vo = carpool_dao.selectOne(carpool_idx);
	      
	      //게시물을 안봤으면 조회수 증가. 게시물 본지 안본지는 세션에 쇼라는 정보 넣어.
	      if(session.getAttribute("show")==null) {
	         
	         //조회수 증가
	         int res = carpool_dao.update_readhit(carpool_idx);
	         
	         //Show정보를 세션에 넣는다
	         session.setAttribute("show", true);
	         
	      }
	      //결과적으로 request binding
	      model.addAttribute("vo", vo);
	      return "board/carpool_view";
	   }
	
	   //새글쓰기 폼띄우기
		@RequestMapping("/board/carpool_insert_form.do")
		public String carpool_insert_form() {

			return "board/carpool_insert_form";
		}
		
		//새글쓰기
		@RequestMapping("/board/carpool_insert.do")
		public String insert(CarpoolVo vo,Model model) {
			
			if(session.getAttribute("user")==null) {
				
				model.addAttribute("reason", "session_timeout");
				
				return "redirect:../board/carpool_list.do";
			}
			
			
			String carpool_ip = request.getRemoteAddr();
			vo.setCarpool_ip(carpool_ip);
			
			int res = carpool_dao.insert(vo);
			
			return "redirect:carpool_list.do";
		}
		
		//게시글수정폼
		@RequestMapping("/board/carpool_modify_form.do")
		public String modify_form(int carpool_idx,
									  Model model) {

			CarpoolVo  vo = carpool_dao.selectOne(carpool_idx);
			
			model.addAttribute("vo", vo);
			
			return "board/carpool_modify_form";
		}
		
		//게시글수정하기
		@RequestMapping("/board/carpool_modify.do")
		public String modify(CarpoolVo vo,
				             int page,
				             @RequestParam(value="search",required=false,defaultValue="carpool_all") String search,
					         @RequestParam(value="search_text",required=false) String search_text, 
				             Model model) {
			
			if(session.getAttribute("user")==null) {
				
				model.addAttribute("reason", "session_timeout");
				
				return "redirect:../admin/carpool_list.do";
			}
			
			
			String carpool_ip = request.getRemoteAddr();
			vo.setCarpool_ip(carpool_ip);
			
			int res = carpool_dao.modify(vo);
			
			model.addAttribute("carpool_idx", vo.getCarpool_idx());
			model.addAttribute("page" , page);
			model.addAttribute("search", search);
			model.addAttribute("search_text", search_text);
			
			return "redirect:/board/carpool_view.do";
		}
		
		
		
		//게시글삭제
		@RequestMapping("carpool_delete.do")
		public String delete(int carpool_idx,
				             int page,
				             @RequestParam(value="search",required=false,defaultValue="carpool_all") String search,
					         @RequestParam(value="search_text",required=false) String search_text, 
				             Model model) {
			
			int res = carpool_dao.delete(carpool_idx);
			
			model.addAttribute("page", page);
			model.addAttribute("search", search);
			model.addAttribute("search_text", search_text);
			
			return "redirect:../admin/carpool_list.do";
		}
	
	/////////////////////////////////////////////////////////////////////////////
		
		
		//마켓
		

		//전체조회
		@RequestMapping("market_list.do")
		public String list2 (@RequestParam(value="page", required = false, defaultValue = "1") int nowPage,
							@RequestParam(value="search", required = false, defaultValue = "market_all") String search,			
							@RequestParam(value="search_text", required = false) String search_text,			  
							Model model) {

				int m_idx = 0;
			      
			    MemberVo user = (MemberVo) session.getAttribute("user");
				int start = (nowPage-1) * MyConstant.Admin.BLOCK_LIST + 1;
				int end = start + MyConstant.Admin.BLOCK_LIST - 1;
				
				Map map = new HashMap();
				map.put("start", start);
				map.put("end", end);
				map.put("m_idx", m_idx);
				
				map.put("market_buy_sell", search_text);
				
				//전체검색이 아니면 검색조건주기
				if(!search.equals("market_all")) {
					
					if(search.equals("market_title_market_content_mem_nickname")) { //제목+이름+내용
						
							map.put("market_title", search_text);
							map.put("market_content", search_text);
							map.put("mem_nickname", search_text);
						
							map.put("market_buy_sell", search_text);
							
					} else if(search.equals("market_title")) {//제목
						
						map.put("market_title", search_text);
						
					} else if(search.equals("market_content")) {//내용
						
						map.put("market_content", search_text);
					
					} else if(search.equals("mem_nickname")) {//닉네임
				
						map.put("mem_nickname", search_text);
					}
						
				}
				
				//전체게시물 수 구하기
				int rowTotal = market_dao.selectRowTotal();
				
				String search_filter = String.format("search=%s&search_text=%s", search, search_text);
				
				String pageMenu = Paging.getPaging("market_list.do",
													 search_filter, 
													 nowPage, 
													 rowTotal, 
													 MyConstant.Admin.BLOCK_LIST, 
													 MyConstant.Admin.BLOCK_PAGE);
				
				
				List<MarketVo> list = market_dao.selectConditionList(map);
				
				model.addAttribute("list",list);
				model.addAttribute("pageMenu", pageMenu);
				
				return "admin/admin_market";
			}
		
		
		@ResponseBody
	    @RequestMapping(value ="/market_insertlike.do", method = RequestMethod.POST)
	    public int market_insertlike(MarketVo vo) {
	 
	       int res = market_dao.market_insertlike(vo);
	       
	       return 1;
	    }
	    
	    @ResponseBody
	    @RequestMapping(value ="/market_deletelike.do", method = RequestMethod.POST)
	    public int market_deletelike(MarketVo vo) {
	       
	       int res = market_dao.market_deletelike(vo);
	       
	       return 1;
	    }
	 
	    @RequestMapping("board/market_view.do")
	    public String market_view(int market_idx,Model model) {
	       
	       //b_idx에 해당되는 게시물 정보 얻어온다 
	       MarketVo vo = market_dao.selectOne(market_idx);
	       
	       //게시물을 안봤으면 조회수 증가. 게시물 본지 안본지는 세션에 쇼라는 정보 넣어.
	       if(session.getAttribute("show")==null) {
	          
	          //조회수 증가
	          int res = market_dao.update_readhit(market_idx);
	          
	          //Show정보를 세션에 넣는다
	          session.setAttribute("show", true);
	          
	       }
	       //결과적으로 request binding
	       model.addAttribute("vo", vo);
	       return "board/market_view";
	    }
		
	    

		   //새글쓰기 폼띄우기
			@RequestMapping("/board/market_insert_form.do")
			public String market_insert_form() {

				return "board/market_insert_form";
			}
			
			//새글쓰기
			@RequestMapping("/board/market_insert.do")
			public String insert(MarketVo vo,Model model) {
				
				if(session.getAttribute("user")==null) {
					
					model.addAttribute("reason", "session_timeout");
					
					return "redirect:../board/market_list.do";
				}
				
				
				String market_ip = request.getRemoteAddr();
				vo.setMarket_ip(market_ip);
				
				int res = market_dao.insert(vo);
				
				return "redirect:market_list.do";
			}
			
			//게시글수정폼
			@RequestMapping("/board/market_modify_form.do")
			public String modify_form2(int market_idx,
										  Model model) {

				MarketVo vo = market_dao.selectOne(market_idx);
				
				model.addAttribute("vo", vo);
				
				return "board/market_modify_form";
			}
			
			//게시글수정하기
			@RequestMapping("/board/market_modify.do")
			public String modify(MarketVo vo,
					             int page,
					             @RequestParam(value="search",required=false,defaultValue="market_all") String search,
						         @RequestParam(value="search_text",required=false) String search_text, 
					             Model model) {
				
				if(session.getAttribute("user")==null) {
					
					model.addAttribute("reason", "session_timeout");
					
					return "redirect:../board/market_list.do";
				}
				
				String market_ip = request.getRemoteAddr();
				vo.setMarket_ip(market_ip);
				
				int res = market_dao.modify(vo);
				
				model.addAttribute("market_idx", vo.getMarket_idx());
				model.addAttribute("page" , page);
				model.addAttribute("search", search);
				model.addAttribute("search_text", search_text);
				
				return "redirect:/board/market_view.do";
			}
			
			
			
			//게시글삭제
			@RequestMapping("/board/market_delete.do")
			public String delete2(int market_idx,
					             int page,
					             @RequestParam(value="search",required=false,defaultValue="market_all") String search,
						         @RequestParam(value="search_text",required=false) String search_text, 
					             Model model) {
				
				int res = market_dao.delete(market_idx);
				
				model.addAttribute("page", page);
				model.addAttribute("search", search);
				model.addAttribute("search_text", search_text);
				
				return "redirect:market_list.do";
			}
		
	/////////////////////////////////////////////////////////////////////
			
		//리뷰
			

			//전체조회
			@RequestMapping("review_list.do")
			public String list3 (@RequestParam(value="page", required = false, defaultValue = "1") int nowPage,
							    @RequestParam(value="search", required = false, defaultValue = "review_all") String search,			
							    @RequestParam(value="search_text", required = false) String search_text,			  
							    Model model) {
				
				int m_idx = 0;
				  
			    MemberVo user = (MemberVo) session.getAttribute("user");
				int start = (nowPage-1) * MyConstant.Admin.BLOCK_LIST + 1;
				int end = start + MyConstant.Admin.BLOCK_LIST - 1;
				if(user!=null)m_idx=user.getMem_idx();
				
				 //세션에 저장되어있는 Show정보를 삭제한다.
			      session.removeAttribute("show");
				
				Map map = new HashMap();
				map.put("start", start);
				map.put("end", end);
				map.put("m_idx", m_idx);
				
				//전체검색이 아니면 검색조건주기
				if(!search.equals("review_all")) {
					
					if(search.equals("review_title_review_content_mem_nickname")) { //제목+이름+내용
						
							map.put("review_title", search_text);
							map.put("review_content", search_text);
							map.put("mem_nickname", search_text);
							
					} else if(search.equals("review_title")) {//제목
						
						map.put("review_title", search_text);
						
					} else if(search.equals("review_content")) {//내용
						
						map.put("review_content", search_text);
					
					} else if(search.equals("mem_nickname")) {//닉네임
				
						map.put("mem_nickname", search_text);
					}
						
				}
				
				//전체게시물 수 구하기
				int rowTotal = review_dao.selectRowTotal(map);
				
				String search_filter = String.format("search=%s&search_text=%s", search, search_text);
				
				String pageMenu = Paging.getPaging("review_list.do", 
												   search_filter, 
												   nowPage, 
												   rowTotal, 
												   MyConstant.Admin.BLOCK_LIST, 
												   MyConstant.Admin.BLOCK_PAGE);
				
				
				List<ReviewVo> list = review_dao.selectConditionList(map);
				
				model.addAttribute("list",list);
				model.addAttribute("pageMenu", pageMenu);
				
				return "/admin/admin_review";
			}

			@RequestMapping("/homepage/review.do")
			   public String review(Model model) {
			      
			      int m_idx = 0;
			      MemberVo user = (MemberVo) session.getAttribute("user");
			      
			      if(user!=null)m_idx=user.getMem_idx();
			      
			      List<ReviewVo> list = review_dao.selectList(m_idx);
			      
			      model.addAttribute("list",list);
			      
			      return "homepage/review_market";
			   }
			   
			   @ResponseBody
			   @RequestMapping(value ="/review_insertlike.do", method = RequestMethod.POST)
			   public int review_insertlike(ReviewVo vo) {

			      int res = review_dao.review_insertlike(vo);
			      
			      return 1;
			   }
			   
			   @ResponseBody
			   @RequestMapping(value ="/review_deletelike.do", method = RequestMethod.POST)
			   public int review_deletelike(ReviewVo vo) {

			      int res = review_dao.review_deletelike(vo);
			      
			      return 1;
			   }
			   
			   @RequestMapping("board/review_view.do")
			   public String review_view(int review_idx,Model model) {
			      
			      //b_idx에 해당되는 게시물 정보 얻어온다 
			      ReviewVo vo = review_dao.selectOne(review_idx);
			      
			      //게시물을 안봤으면 조회수 증가. 게시물 본지 안본지는 세션에 쇼라는 정보 넣어.
			      if(session.getAttribute("show")==null) {
			         
			         //조회수 증가
			         int res = review_dao.update_readhit(review_idx);
			         
			         //Show정보를 세션에 넣는다
			         session.setAttribute("show", true);
			         
			      }
			      //결과적으로 request binding
			      model.addAttribute("vo", vo);
			      return "board/review_view";
			   }
			 

			   //새글쓰기 폼띄우기
				@RequestMapping("/board/review_insert_form.do")
				public String review_insert_form() {

					return "board/review_insert_form";
				}
				
				//새글쓰기
				@RequestMapping("/board/review_insert.do")
				public String insert(ReviewVo vo,Model model) {
					
					if(session.getAttribute("user")==null) {
						
						model.addAttribute("reason", "session_timeout");
						
						return "redirect:../board/review_list.do";
					}
					
					
					String review_ip = request.getRemoteAddr();
					vo.setReview_ip(review_ip);
					
					int res = review_dao.insert(vo);
					
					return "redirect:review_list.do";
				}
				
				//게시글수정폼
				@RequestMapping("/board/review_modify_form.do")
				public String modify_form3(int review_idx,
											  Model model) {

					ReviewVo vo = review_dao.selectOne(review_idx);
					
					model.addAttribute("vo", vo);
					
					return "board/review_modify_form";
				}
				
				//게시글수정하기
				@RequestMapping("/board/review_modify.do")
				public String modify(ReviewVo vo,
						             int page,
						             @RequestParam(value="search",required=false,defaultValue="review_all") String search,
							         @RequestParam(value="search_text",required=false) String search_text, 
						             Model model) {
					
					if(session.getAttribute("user")==null) {
						
						model.addAttribute("reason", "session_timeout");
						
						return "redirect:../board/review_list.do";
					}
					
					
					String review_ip = request.getRemoteAddr();
					vo.setReview_ip(review_ip);
					
					int res = review_dao.modify(vo);
					
					model.addAttribute("review_idx", vo.getReview_idx());
					model.addAttribute("page" , page);
					model.addAttribute("search", search);
					model.addAttribute("search_text", search_text);
					
					return "redirect:/board/review_view.do";
				}
				
				
				
				//게시글삭제
				@RequestMapping("/board/review_delete.do")
				public String delete3(int review_idx,
						             int page,
						             @RequestParam(value="search",required=false,defaultValue="review_all") String search,
							         @RequestParam(value="search_text",required=false) String search_text, 
						             Model model) {
					
					int res = review_dao.delete(review_idx);
					
					model.addAttribute("page", page);
					model.addAttribute("search", search);
					model.addAttribute("search_text", search_text);
					
					return "redirect:review_list.do";
				}
			
			////////////////////////////////////////////////////////////
			//멤버
			    
			//관리자페이지 멤버전체조회
		      @RequestMapping("member_list.do")
		      public String list4(@RequestParam(value="page", required = false, defaultValue = "1") int nowPage,
		                       @RequestParam(value="search", required = false, defaultValue = "member_all") String search,         
		                       @RequestParam(value="search_text", required = false) String search_text,           
		                       Model model) {
		         
		        int start = (nowPage-1) * MyConstant.Admin.BLOCK_LIST + 1;
		        int end = start + MyConstant.Admin.BLOCK_LIST - 1;
		        
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
		         
		         String pageMenu = Paging.getPaging("member_list.do",
		                                     search_filter, 
		                                     nowPage, 
		                                     rowTotal, 
		                                     MyConstant.Admin.BLOCK_LIST, 
		                                     MyConstant.Admin.BLOCK_PAGE);
		         
		         List<MemberVo> list = member_dao.selectConditionList(map);
		         
		         model.addAttribute("list",list);
		         model.addAttribute("pageMenu", pageMenu);
		      
		       
		         return "admin/admin_member";
		        
		         
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
		         
		         if(user.getMem_status()==0) {
		            System.out.println("mem_out");
		            map.put("result", "fail_mem_out");
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
		      vo.setMem_status(1);
		      
		      
		      
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
		      model.addAttribute("replyLikeCount",replyLikeCount);

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
		      
		   //관리자페이지 멤버등급변경
		   @RequestMapping("grade_change.do")
		   public String list1(@RequestParam(value="page", required = false, defaultValue = "1") int nowPage,
		                    @RequestParam(value="search", required = false, defaultValue = "member_all") String search,         
		                    @RequestParam(value="search_text", required = false) String search_text,           
		                    Model model) {
		     int start = (nowPage-1) * MyConstant.Admin.BLOCK_LIST + 1;
		     int end = start + MyConstant.Admin.BLOCK_LIST - 1;

		     
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
		      
		      String pageMenu = Paging.getPaging("grade_change.do",
		                                  search_filter, 
		                                  nowPage, 
		                                  rowTotal, 

		                                  MyConstant.Admin.BLOCK_LIST, 
		                                  MyConstant.Admin.BLOCK_PAGE);

		      
		      List<MemberVo> list = member_dao.selectConditionList(map);
		      
		      
		      model.addAttribute("list",list);
		      model.addAttribute("pageMenu", pageMenu);
		   
		      //return "admin/admin_page";
		     //return "mypage/your_page";
		       return "admin/grade_change";
		      
		   }
		   
		      
		   	
			
				
	
}
