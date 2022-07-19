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

import dao.ReviewDao;
import vo.MarketVo;
import vo.MemberVo;
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
		this.review_dao = review_dao;
	}


	@RequestMapping("/board/review_list.do")
	public String list(Model model) {
		
		int m_idx = 0;
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		if(user!=null)m_idx=user.getMem_idx();
		
		List<ReviewVo> list = review_dao.selectList(m_idx);
		
		model.addAttribute("list",list);
		
		return "board/review_board";
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
	public Map review_insertlike(@RequestParam int mem_idx,int review_idx,Model model,ReviewVo vo) {
		
		Map map = new HashMap();
		map.put("m_idx", mem_idx);
		map.put("review_idx", review_idx);
	
		int res = review_dao.review_insertlike(vo);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value ="/review_deletelike.do", method = RequestMethod.POST)
	public int review_deletelike(@RequestParam int mem_idx,int review_idx,Model model,ReviewVo vo) {
		
		Map map = new HashMap();
		map.put("m_idx", mem_idx);
		map.put("review_idx", review_idx);
	
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
}
