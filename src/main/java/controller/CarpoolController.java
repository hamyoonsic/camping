package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.MyConstant;
import dao.CarpoolDao;
import dao.MarketDao;
import util.Paging;
import vo.CarpoolVo;
import vo.MarketVo;
import vo.MemberVo;

@Controller
public class CarpoolController {
	
	@Autowired
	ServletContext applicaton;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	
	CarpoolDao carpool_dao;

	public void setCarpool_dao(CarpoolDao carpool_dao) {
		this.carpool_dao = carpool_dao;
	}
	
	MarketDao market_dao;
	
	public void setMarket_dao(MarketDao market_dao) {
		this.market_dao = market_dao;
	}
	
	
	
	/*
	 * @RequestMapping("/board/carpool_list.do") public String list(Model model) {
	 * 
	 * List<CarpoolVo> list = carpool_dao.selectList();
	 * 
	 * model.addAttribute("list",list);
	 * 
	 * return "board/carpool_board"; }
	 */

	@RequestMapping("/")
	   public String main(Model model) {
	      
	      int m_idx = 0;
	      MemberVo user = (MemberVo) session.getAttribute("user");
	      
	      if(user!=null)m_idx=user.getMem_idx();
	      
	      List<CarpoolVo> list = carpool_dao.selectList(m_idx);
	      List<MarketVo> list1 = market_dao.selectList(m_idx);
	      
	      model.addAttribute("list",list);
	      model.addAttribute("list1",list1);
	      
	      return "homepage/main";
	   }


	//전체조회
	@RequestMapping("/board/carpool_list.do")
	   public String list(@RequestParam(value="page", required = false, defaultValue = "1") int nowPage,
			   			  @RequestParam(value="search", required = false, defaultValue = "carpool_all") String search,         
			   			  @RequestParam(value="search_text", required = false) String search_text,           
			   			  Model model) {
	      
	      int m_idx = 0;
	      
	      MemberVo user = (MemberVo) session.getAttribute("user");
	      int start = (nowPage-1) * MyConstant.Carpool.BLOCK_LIST + 1;
	      int end = start + MyConstant.Carpool.BLOCK_LIST - 1;
	      if(user!=null)m_idx=user.getMem_idx();
	      
	      
	      //세션에 저장되어있는 Show정보를 삭제한다.
	      session.removeAttribute("show");
	      
	      Map map = new HashMap();
	      map.put("start", start);
	      map.put("end", end);
	      map.put("m_idx", m_idx);

	      
	      //전체검색이 아니면 검색조건주기
	      if(!search.equals("carpool_all")) {
	         
	         if(search.equals("carpool_title_carpool_content_mem_nickname")) { //제목+이름+내용
	            
	               map.put("carpool_title", search_text);
	               map.put("carpool_content", search_text);
	               map.put("mem_nickname", search_text);
	               
	         } else if(search.equals("carpool_title")) {//제목
	            
	            map.put("carpool_title", search_text);
	            
	         } else if(search.equals("carpool_content")) {//내용
	            
	            map.put("carpool_content", search_text);
	         
	         } else if(search.equals("mem_nickname")) {//닉네임
	      
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
	                                  MyConstant.Carpool.BLOCK_LIST, 
	                                  MyConstant.Carpool.BLOCK_PAGE);
	      
	      List<CarpoolVo> list = carpool_dao.selectConditionList(map);
	      
	      model.addAttribute("list",list);
	      model.addAttribute("pageMenu", pageMenu);
	   
	      return "board/carpool_board";
	   }
	
	//좋아요
	@RequestMapping("/homepage/carpool.do")
	   public String carpool(Model model) {
	      
	      int m_idx = 0;
	      MemberVo user = (MemberVo) session.getAttribute("user");
	      
	      if(user!=null)m_idx=user.getMem_idx();
	      
	      List<CarpoolVo> list = carpool_dao.selectList(m_idx);
	      
	      model.addAttribute("list",list);
	      
	      return "homepage/carpool_market";
	   }
	   
	   @ResponseBody
	   @RequestMapping(value ="/carpool_insertlike.do", method = RequestMethod.POST)
	   public int carpool_insertlike(CarpoolVo vo) {
	      
	      int res = carpool_dao.carpool_insertlike(vo);
	      
	      return 1;
	   }
	   
	   @ResponseBody
	   @RequestMapping(value ="/carpool_deletelike.do", method = RequestMethod.POST)
	   public int carpool_deletelike(CarpoolVo vo) {
	      
	      int res = carpool_dao.carpool_deletelike(vo);
	      
	      return 1;
	   }
	   
	   @RequestMapping("board/carpool_view.do")
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
	
	
}