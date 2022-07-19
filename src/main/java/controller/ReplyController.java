package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ReviewReplyDao;
import vo.ReviewReplyVo;

@Controller
@RequestMapping("/board/post/")
public class ReplyController {

	ReviewReplyDao review_reply_dao;

	public void setReview_reply_dao(ReviewReplyDao review_reply_dao) {
		this.review_reply_dao = review_reply_dao;
	}

	@Autowired
	HttpServletRequest request;
	
	
	
	@RequestMapping("list.do")
	public String review_reply_list(Model model) {
		
		List<ReviewReplyVo> list = review_reply_dao.selectList();
		
		model.addAttribute("review_reply_list",list);
		
		return "board/post";
		
	}
	
	
	
	@RequestMapping("review_reply_insert.do")
	@ResponseBody
	public int review_reply_insert(ReviewReplyVo vo) {
		
		/*
		 * vo.setMem_idx(mem_idx); vo.setMem_nickname(mem_nickname);
		 * vo.setReview_idx(review_idx);
		 * vo.setReview_reply_content(review_reply_content);
		 */
		
		System.out.println(vo.getMem_idx());
		System.out.println(vo.getMem_nickname());
		System.out.println(vo.getReview_idx());
		System.out.println(vo.getReview_reply_content());
		
		
		String review_reply_ip = request.getRemoteAddr();
		
		vo.setReview_reply_ip(review_reply_ip);
		
		int res = review_reply_dao.insert(vo);
		
		System.out.println("---------");
		
		return res;
	}
	
	
}
