package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CarpoolReplyDao;
import dao.MarketReplyDao;
import dao.ReviewReplyDao;
import vo.CarpoolReplyVo;
import vo.MarketReplyVo;
import vo.ReviewReplyVo;

@Controller
@RequestMapping("/board/")
public class ReplyController {
	
	ReviewReplyDao review_reply_dao;
	MarketReplyDao market_reply_dao;
	CarpoolReplyDao carpool_reply_dao;
	
	public void setReview_reply_dao(ReviewReplyDao review_reply_dao) {
		this.review_reply_dao = review_reply_dao;
	}
	
	public void setMarket_reply_dao(MarketReplyDao market_reply_dao) {
		this.market_reply_dao = market_reply_dao;
	}
	
	public void setCarpool_reply_dao(CarpoolReplyDao carpool_reply_dao) {
		this.carpool_reply_dao = carpool_reply_dao;
	}

	@Autowired
	HttpServletRequest request;
	
	//-----------------------------------------------review-------------------------------------------------------------
	@RequestMapping("review_reply_list.do")
	public String review_reply_list(int review_idx,
									@RequestParam(value="page", required=false, defaultValue="1") int nowPage,
									Model model) {
		
		int start	=	(nowPage-1)*3 + 1;
		int end		=	start + 3 - 1 ;

		Map map	=	new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("review_idx", review_idx);
		
		
		List<ReviewReplyVo> list	=	review_reply_dao.selectList(map);
		
		model.addAttribute("list", list);
		
		return "board/review_comment_list";
	}
									
	
	
	
	@RequestMapping("review_reply_insert.do")
	@ResponseBody
	public Map review_reply_insert(ReviewReplyVo vo) {
		
		
		String review_reply_content	=	vo.getReview_reply_content().replaceAll("\n", "<br>");
		String review_reply_ip = request.getRemoteAddr();
		
		vo.setReview_reply_ip(review_reply_ip);
		vo.setReview_reply_content(review_reply_content);
		
		int res = review_reply_dao.insert(vo);
		
		Map map = new HashMap();
		
		if(res==1)
			map.put("result", true);
		else
			map.put("result", false);
				
				
				
		return map;
	}
	
	
	@RequestMapping("review_reply_delete.do")
	@ResponseBody
	public Map review_reply_delete(int review_idx){
		
		int res = review_reply_dao.delete(review_idx);
		
		
		Map map = new HashMap();
		
		if(res==1)
			map.put("result", true);
		else
			map.put("result", false);
		
		return map;
	}
	
	//-----------------------------------------------carpool-------------------------------------------------------------
		
		@RequestMapping("carpool_reply_list.do")
		public String carpool_reply_list(int carpool_idx,
										@RequestParam(value="page", required=false, defaultValue="1") int nowPage,
										Model model) {
			
			int start	=	(nowPage-1)*3 + 1;
			int end		=	start + 3 - 1 ;

			Map map	=	new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("carpool_idx", carpool_idx);
			
			
			List<CarpoolReplyVo> list	=	carpool_reply_dao.selectList(map);
			
			model.addAttribute("list", list);
			
			return "board/carpool_comment_list";
		}
										
		
		
		
		@RequestMapping("carpool_reply_insert.do")
		@ResponseBody
		public Map carpool_reply_insert(CarpoolReplyVo vo) {
			
			
			String carpool_reply_content	=	vo.getCarpool_reply_content().replaceAll("\n", "<br>");
			String carpool_reply_ip = request.getRemoteAddr();
			
			vo.setCarpool_reply_ip(carpool_reply_ip);
			vo.setCarpool_reply_content(carpool_reply_content);
			
			int res = carpool_reply_dao.insert(vo);
			
			Map map = new HashMap();
			
			if(res==1)
				map.put("result", true);
			else
				map.put("result", false);
					
					
					
			return map;
		}
		
		
		@RequestMapping("carpool_reply_delete.do")
		@ResponseBody
		public Map carpool_reply_delete(int carpool_idx){
			
			int res = carpool_reply_dao.delete(carpool_idx);
			
			
			Map map = new HashMap();
			
			if(res==1)
				map.put("result", true);
			else
				map.put("result", false);
			
			return map;
		}
		
		
		//-----------------------------------------------market-------------------------------------------------------------
		
		@RequestMapping("market_reply_list.do")
		public String market_reply_list(int market_idx,
										@RequestParam(value="page", required=false, defaultValue="1") int nowPage,
										Model model) {
			
			int start	=	(nowPage-1)*3 + 1;
			int end		=	start + 3 - 1 ;

			Map map	=	new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("market_idx", market_idx);
			
			
			List<MarketReplyVo> list	=	market_reply_dao.selectList(map);
			
			model.addAttribute("list", list);
			
			return "board/market_comment_list";
		}
										
		
		
		
		@RequestMapping("market_reply_insert.do")
		@ResponseBody
		public Map market_reply_insert(MarketReplyVo vo) {
			
			
			String market_reply_content	=	vo.getMarket_reply_content().replaceAll("\n", "<br>");
			String market_reply_ip = request.getRemoteAddr();
			
			vo.setMarket_reply_ip(market_reply_ip);
			vo.setMarket_reply_content(market_reply_content);
			
			int res = market_reply_dao.insert(vo);
			
			Map map = new HashMap();
			
			if(res==1)
				map.put("result", true);
			else
				map.put("result", false);
					
					
					
			return map;
		}
		
		
		@RequestMapping("market_reply_delete.do")
		@ResponseBody
		public Map market_reply_delete(int market_idx){
			
			int res = market_reply_dao.delete(market_idx);
			
			
			Map map = new HashMap();
			
			if(res==1)
				map.put("result", true);
			else
				map.put("result", false);
			
			return map;
		}
		
		//´ä±ÛÆû ¶ç¿ì±â
		@RequestMapping("comment_form.do")
		public String market_reply_list(int review_reply_idx) {
			
			
			return "board/comment_form";
		}
}
