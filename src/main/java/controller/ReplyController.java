package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ReviewReplyDao;
import vo.ReviewReplyVo;

@Controller
@RequestMapping("/board/post/")
public class ReplyController {

	ReviewReplyDao review_reply_dao;

	public void setReview_reply_dao(ReviewReplyDao review_reply_dao) {
		this.review_reply_dao = review_reply_dao;
	}

	@RequestMapping("list.do")
	public String review_reply_list(Model model) {
		
		List<ReviewReplyVo> list = review_reply_dao.selectList();
		
		model.addAttribute("review_reply_list",list);
		
		return "board/post";
		
	}
	
}
