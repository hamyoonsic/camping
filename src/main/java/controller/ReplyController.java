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

import common.MyConstant;
import dao.CarpoolReplyDao;
import dao.MarketReplyDao;
import dao.ReviewReplyDao;
import util.Paging;
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
		
		
		
		int start	=	(nowPage-1)* MyConstant.Comment.BLOCK_LIST + 1;
		int end		=	start + MyConstant.Comment.BLOCK_LIST - 1 ;

		
		Map map	=	new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("review_idx", review_idx);
		
		int rowTotal	=	review_reply_dao.selectRowTotal();
		
		
		
		String review_pageMenu	=	Paging.review_commentPaging("review_view.do", 
												 nowPage, rowTotal, MyConstant.Comment.BLOCK_LIST, MyConstant.Comment.BLOCK_PAGE, review_idx);
		List<ReviewReplyVo> list	=	review_reply_dao.selectList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("review_pageMenu", review_pageMenu);
		
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
	public Map review_reply_delete(int review_reply_idx){
		
		int res = review_reply_dao.delete(review_reply_idx);
		
		
		Map map = new HashMap();
		
		if(res==1)
			map.put("result", true);
		else
			map.put("result", false);
		
		return map;
	}
	
	//답글폼 띄우기
	@RequestMapping("review_comment_form.do")
	public String review_reply_list(int review_reply_idx, Model model, int page) {
		
		model.addAttribute("base_idx",review_reply_idx);
		model.addAttribute("page", page);
		
		return "board/review_comment_form";
	}
		
		
	@RequestMapping("review_reply_re.do")
	@ResponseBody
	public Map review_reply_re(ReviewReplyVo vo, int page, Model model) {
		
		
		String review_reply_recontent	=	vo.getReview_reply_content().replaceAll("\n", "<br>");
		String review_reply_ip = request.getRemoteAddr();
		
		vo.setReview_reply_ip(review_reply_ip);
		vo.setReview_reply_content(review_reply_recontent);
		
		
		//기준글 정보 얻어오기
		ReviewReplyVo baseVo = review_reply_dao.selectOne(vo.getReview_reply_idx());
		
		//기준글 보다 큰 게시물 step+1증가
		int res	=	review_reply_dao.update_step(baseVo);
		
		vo.setReview_idx(baseVo.getReview_idx());
		vo.setReview_reply_ref(baseVo.getReview_reply_ref());
		vo.setReview_reply_step(baseVo.getReview_reply_step()+1);
		vo.setReview_reply_depth(baseVo.getReview_reply_depth()+1);
		
		res	=	review_reply_dao.reply(vo);
		
		
		Map map = new HashMap();
		
		if(res==1)
			map.put("result", true);
		else
			map.put("result", false);
				
				
		model.addAttribute("page",page);		
		
		return map;
		
	}
	
	//-----------------------------------------------carpool-------------------------------------------------------------
		
		@RequestMapping("carpool_reply_list.do")
		public String carpool_reply_list(int carpool_idx,
										@RequestParam(value="page", required=false, defaultValue="1") int nowPage,
										Model model) {
			
			int start	=	(nowPage-1)*MyConstant.Comment.BLOCK_LIST + 1;
			int end		=	start + MyConstant.Comment.BLOCK_LIST - 1 ;

			Map map	=	new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("carpool_idx", carpool_idx);
			
			int rowTotal	=	carpool_reply_dao.selectRowTotal();
			
			List<CarpoolReplyVo> list	=	carpool_reply_dao.selectList(map);
			
			String carpool_pageMenu	=	Paging.carpool_commentPaging("carpool_view.do", 
					 nowPage, rowTotal, MyConstant.Comment.BLOCK_LIST, MyConstant.Comment.BLOCK_PAGE, carpool_idx);

			
			model.addAttribute("list", list);
			model.addAttribute("carpool_pageMenu",  carpool_pageMenu);
			
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
		public Map carpool_reply_delete(int carpool_reply_idx){
			
			int res = carpool_reply_dao.delete(carpool_reply_idx);
			
			
			Map map = new HashMap();
			
			if(res==1)
				map.put("result", true);
			else
				map.put("result", false);
			
			return map;
		}
		
		//답글폼 띄우기
		@RequestMapping("carpool_comment_form.do")
		public String carpool_reply_list(int carpool_reply_idx, Model model, int page) {
			
			model.addAttribute("base_idx",carpool_reply_idx);
			model.addAttribute("page", page);
			
			return "board/carpool_comment_form";
		}
			
			
		@RequestMapping("carpool_reply_re.do")
		@ResponseBody
		public Map carpool_reply_re(CarpoolReplyVo vo, int page, Model model) {
			
			String carpool_reply_recontent	=	vo.getCarpool_reply_content().replaceAll("\n", "<br>");
			String carpool_reply_ip = request.getRemoteAddr();
			
			vo.setCarpool_reply_ip(carpool_reply_ip);
			vo.setCarpool_reply_content(carpool_reply_recontent);
			
			
			//기준글 정보 얻어오기
			CarpoolReplyVo baseVo = carpool_reply_dao.selectOne(vo.getCarpool_reply_idx());
			
			//기준글 보다 큰 게시물 step+1증가
			int res	=	carpool_reply_dao.update_step(baseVo);
			
			vo.setCarpool_idx(baseVo.getCarpool_idx());
			vo.setCarpool_reply_ref(baseVo.getCarpool_reply_ref());
			vo.setCarpool_reply_step(baseVo.getCarpool_reply_step()+1);
			vo.setCarpool_reply_depth(baseVo.getCarpool_reply_depth()+1);
			
			res	=	carpool_reply_dao.reply(vo);
			
			
			Map map = new HashMap();
			
			if(res==1)
				map.put("result", true);
			else
				map.put("result", false);
			
			model.addAttribute("page",page);
					
					
			return map;
			
		}
		
		
		//-----------------------------------------------market-------------------------------------------------------------
		
		@RequestMapping("market_reply_list.do")
		public String market_reply_list(int market_idx,
										@RequestParam(value="page", required=false, defaultValue="1") int nowPage,
										Model model) {
			
			int start	=	(nowPage-1)*MyConstant.Comment.BLOCK_LIST + 1;
			int end		=	start + MyConstant.Comment.BLOCK_LIST - 1 ;

			Map map	=	new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("market_idx", market_idx);
			
			int rowTotal	=	market_reply_dao.selectRowTotal();
			
			List<MarketReplyVo> list	=	market_reply_dao.selectList(map);
			
			
			String market_pageMenu	=	Paging.market_commentPaging("market_view.do", 
					 nowPage, rowTotal, MyConstant.Comment.BLOCK_LIST, MyConstant.Comment.BLOCK_PAGE, market_idx);

			
			
			
			model.addAttribute("list", list);
			model.addAttribute("market_pageMenu",  market_pageMenu);
			
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
		public Map market_reply_delete(int market_reply_idx){
			
			int res = market_reply_dao.delete(market_reply_idx);
			
			
			Map map = new HashMap();
			
			if(res==1)
				map.put("result", true);
			else
				map.put("result", false);
			
			return map;
		}
		
		//답글폼 띄우기
		@RequestMapping("market_comment_form.do")
		public String market_reply_list(int market_reply_idx, Model model, int page) {
			
			model.addAttribute("base_idx",market_reply_idx);
			model.addAttribute("page", page);
			
			return "board/market_comment_form";
		}
			
			
		@RequestMapping("market_reply_re.do")
		@ResponseBody
		public Map market_reply_re(MarketReplyVo vo, Model model, int page) {
			
			String market_reply_recontent	=	vo.getMarket_reply_content().replaceAll("\n", "<br>");
			String market_reply_ip = request.getRemoteAddr();
			
			vo.setMarket_reply_ip(market_reply_ip);
			vo.setMarket_reply_content(market_reply_recontent);
			
			
			//기준글 정보 얻어오기
			MarketReplyVo baseVo = market_reply_dao.selectOne(vo.getMarket_reply_idx());
			
			//기준글 보다 큰 게시물 step+1증가
			int res	=	market_reply_dao.update_step(baseVo);
			
			vo.setMarket_idx(baseVo.getMarket_idx());
			vo.setMarket_reply_ref(baseVo.getMarket_reply_ref());
			vo.setMarket_reply_step(baseVo.getMarket_reply_step()+1);
			vo.setMarket_reply_depth(baseVo.getMarket_reply_depth()+1);
			
			res	=	market_reply_dao.reply(vo);
			
			
			Map map = new HashMap();
			
			if(res==1)
				map.put("result", true);
			else
				map.put("result", false);
					
			model.addAttribute("page",page);
					
					
			return map;
			
		}
		
		
		
		
		
}
