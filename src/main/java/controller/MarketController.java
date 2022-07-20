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
import org.springframework.web.bind.annotation.RequestParam;

import common.MyConstant;
import dao.MarketDao;
import util.Paging;
import vo.MarketVo;

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

	@RequestMapping("/")
	public String main(Model model) {
		
		List<MarketVo> list = market_dao.selectList();
		
		model.addAttribute("list",list);
		
		return "homepage/main";
	}
	
	@RequestMapping("/homepage/market.do")
	public String carpool(Model model) {
		
		List<MarketVo> list = market_dao.selectList();
		
		model.addAttribute("list",list);
		
		return "homepage/carpool_market";
	}
	
	
	//전체조회
	@RequestMapping("/board/market_list.do")
	public String list (@RequestParam(value="page", required = false, defaultValue = "1") int nowPage,
						@RequestParam(value="search", required = false, defaultValue = "market_all") String search,			
						@RequestParam(value="search_text", required = false) String search_text,			  
						Model model) {

			int start = (nowPage-1) * MyConstant.Market.BLOCK_LIST + 1;
			int end = start + MyConstant.Market.BLOCK_LIST - 1;
			
			Map map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			
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
			
			
			List<MarketVo> list = market_dao.selectList(map);
			
			model.addAttribute("list",list);
			model.addAttribute("pageMenu", pageMenu);
			
			return "board/market_board";
		}
	
	
	
	
}