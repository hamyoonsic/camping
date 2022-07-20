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
import dao.MarketDao;
import util.Paging;
import vo.MarketVo;
import vo.MemberVo;

@Controller
public class MarketController {
	
	@Autowired
	ServletContext applicaton;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	
	MarketDao market_dao;
	

	public void setMarket_dao(MarketDao market_dao) {
		this.market_dao = market_dao;
	}

	@RequestMapping("/homepage/market.do")
	   public String market(Model model) {
	      
	      int m_idx = 0;
	      MemberVo user = (MemberVo) session.getAttribute("user");
	      
	      if(user!=null)m_idx=user.getMem_idx();
	      
	      List<MarketVo> list1 = market_dao.selectList(m_idx);
	      
	      model.addAttribute("list1",list1);
	      
	      return "homepage/carpool_market";
	   }
	
	//전체조회
	@RequestMapping("/board/market_list.do")
	public String list (@RequestParam(value="page", required = false, defaultValue = "1") int nowPage,
						@RequestParam(value="search", required = false, defaultValue = "market_all") String search,			
						@RequestParam(value="search_text", required = false) String search_text,			  
						Model model) {

			int m_idx = 0;
		      
		    MemberVo user = (MemberVo) session.getAttribute("user");
			int start = (nowPage-1) * MyConstant.Market.BLOCK_LIST + 1;
			int end = start + MyConstant.Market.BLOCK_LIST - 1;
			
			Map map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("m_idx", m_idx);
			
			//전체검색이 아니면 검색조건주기
			if(!search.equals("market_all")) {
				
				if(search.equals("market_title_market_content_mem_nickname")) { //제목+이름+내용
					
						map.put("market_title", search_text);
						map.put("market_content", search_text);
						map.put("mem_nickname", search_text);
						
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
												 MyConstant.Market.BLOCK_LIST, 
												 MyConstant.Market.BLOCK_PAGE);
			
			
			List<MarketVo> list = market_dao.selectConditionList(map);
			
			model.addAttribute("list",list);
			model.addAttribute("pageMenu", pageMenu);
			
			return "board/market_board";
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
	
	
}