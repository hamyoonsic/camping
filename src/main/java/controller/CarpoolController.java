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
import dao.CarpoolDao;
import util.Paging;
import vo.CarpoolVo;

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
	
	/*
	 * @RequestMapping("/board/carpool_list.do") public String list(Model model) {
	 * 
	 * List<CarpoolVo> list = carpool_dao.selectList();
	 * 
	 * model.addAttribute("list",list);
	 * 
	 * return "board/carpool_board"; }
	 */
	
	@RequestMapping("") 
	public String main(Model model) {
		
		List<CarpoolVo> list = carpool_dao.selectList();
		
		model.addAttribute("list",list);
		
		return "/homepage/main";
	}
	
	@RequestMapping("/homepage/carpool.do")
	public String carpool(Model model) {
		
		List<CarpoolVo> list = carpool_dao.selectList();
		
		model.addAttribute("list",list);
		
		return "/homepage/carpool_market";
	}
	/*
	@ResponseBody
	@RequestMapping(value ="/carpool_insertlike.do", method = RequestMethod.POST)
	public Map carpool_insertlike(@RequestParam Map map) {
		
		Map map = new Map;
	
		int res = carpool_dao.carpool_insertlike(map);
		
		return "redirect:carpool_list.do";
	}*/

	//전체조회
	@RequestMapping("/board/carpool_list.do")
	public String list (@RequestParam(value="page", required = false, defaultValue = "1") int nowPage,
						@RequestParam(value="search", required = false, defaultValue = "carpool_all") String search,			
						@RequestParam(value="search_text", required = false) String search_text,			  
				        Model model) {
	
		//페이징
		int start = (nowPage-1) * MyConstant.Carpool.BLOCK_LIST + 1;
		int end = start + MyConstant.Carpool.BLOCK_LIST - 1;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);

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
		
		
		List<CarpoolVo> list = carpool_dao.selectList(map);
		
		model.addAttribute("list",list);
		model.addAttribute("pageMenu", pageMenu);
		
		return "/board/carpool_board";
	}


	
	
}