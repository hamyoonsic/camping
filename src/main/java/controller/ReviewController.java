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
import dao.ReviewDao;
import util.Paging;
import vo.ReviewVo;

@Controller
public class ReviewController {

	@Autowired
	ServletContext applicaton;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	
	ReviewDao review_dao;

	public void setReview_dao(ReviewDao review_dao) {
		this.review_dao = (ReviewDao) review_dao;
	}


	//전체조회
	@RequestMapping("/board/review_list.do")
	public String list (@RequestParam(value="page", required = false, defaultValue = "1") int nowPage,
					    @RequestParam(value="search", required = false, defaultValue = "review_all") String search,			
					    @RequestParam(value="search_text", required = false) String search_text,			  
					    Model model) {
	
		int start = (nowPage-1) * MyConstant.Review.BLOCK_LIST + 1;
		int end = start + MyConstant.Review.BLOCK_LIST - 1;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		//전체검색이 아니면 검색조건주기
		if(!search.equals("review_all")) {
			
			if(search.equals("review_title_review_content_review_nickname")) { //제목+이름+내용
				
					map.put("review_title", search_text);
					map.put("review_content", search_text);
					map.put("review_nickname", search_text);
					
			} else if(search.equals("review_title")) {//제목
				
				map.put("review_title", search_text);
				
			} else if(search.equals("review_content")) {//내용
				
				map.put("review_content", search_text);
			
			} else if(search.equals("mem_nickname")) {//닉네임
		
				map.put("mem_nickname", search_text);
			}
				
		}
		
		//전체게시물 수 구하기
		int rowTotal = review_dao.selectRowTotal();
		
		String search_filter = String.format("search=%s&search_text=%s", search, search_text);
		
		String pageMenu = Paging.getPaging("review_list.do",
											 search_filter, 
											 nowPage, 
											 rowTotal, 
											 MyConstant.Review.BLOCK_LIST, 
											 MyConstant.Review.BLOCK_PAGE);
		
		
		List<ReviewVo> list = review_dao.selectList(map);
		
		model.addAttribute("list",list);
		model.addAttribute("pageMenu", pageMenu);
		
		return "/board/review_board";
	}

		
	 
}
