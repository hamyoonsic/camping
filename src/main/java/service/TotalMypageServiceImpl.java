package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.CarpoolDao;
import dao.CarpoolReplyDao;
import dao.MarketDao;
import dao.MarketReplyDao;
import dao.ReviewDao;
import dao.ReviewReplyDao;
import vo.CarpoolReplyVo;
import vo.CarpoolVo;
import vo.MarketReplyVo;
import vo.MarketVo;
import vo.ReviewReplyVo;
import vo.ReviewVo;

public class TotalMypageServiceImpl implements TotalMypageService {

	CarpoolDao carpool_dao;
	MarketDao market_dao;
	ReviewDao review_dao;
	
	CarpoolReplyDao carpool_reply_dao;
	MarketReplyDao  market_reply_dao;
	ReviewReplyDao  review_reply_dao;



	public TotalMypageServiceImpl() {
	}

    
	
	
	public TotalMypageServiceImpl(CarpoolDao carpool_dao, MarketDao market_dao, ReviewDao review_dao,
			CarpoolReplyDao carpool_reply_dao, MarketReplyDao market_reply_dao, ReviewReplyDao review_reply_dao) {
		super();
		this.carpool_dao = carpool_dao;
		this.market_dao = market_dao;
		this.review_dao = review_dao;
		this.carpool_reply_dao = carpool_reply_dao;
		this.market_reply_dao = market_reply_dao;
		this.review_reply_dao = review_reply_dao;
	}







	@Override
	   public Map category_list(Map map) {
	      // TODO Auto-generated method stub
	      
	      List carpool_mem_list =carpool_dao.carpool_mem_list(map);
	     
	      
	      List market_mem_list  =market_dao.market_mem_list(map);
	      
	      List review_mem_list    =review_dao.review_mem_list(map);
	      
	      int c_no = carpool_mem_list.size();
	      int m_no = market_mem_list.size();
	      int r_no = review_mem_list.size();
	      
	      int total_no = c_no + m_no + r_no;
	      
	      Map map2 = new HashMap();
	      
	     
	      
	      map2.put("carpool_mem_list",carpool_mem_list);
	      map2.put("market_mem_list", market_mem_list);
	      map2.put("review_mem_list", review_mem_list);
	      map2.put("total_no", total_no);
	      
	      return map2;
	   }



	@Override
	public Map category_reply_list(Map map) {
		// TODO Auto-generated method stub
		
		List<CarpoolReplyVo> carpool_reply_mem_list = carpool_reply_dao.carpool_reply_mem_list(map);
		List<MarketReplyVo>  market_reply_mem_list = market_reply_dao.market_reply_mem_list(map);
		List<ReviewReplyVo>	 review_reply_mem_list = review_reply_dao.review_reply_mem_list(map);
		
	  int c_r_no = carpool_reply_mem_list.size();
	  int m_r_no = market_reply_mem_list.size();
	  int r_r_no = review_reply_mem_list.size();
	  
	  int total_reply_no = c_r_no + m_r_no + r_r_no;

	  Map map1 = new HashMap();
	  
	  map1.put("carpool_reply_mem_list", carpool_reply_mem_list);
	  map1.put("market_reply_mem_list", market_reply_mem_list);
	  map1.put("review_reply_mem_list", review_reply_mem_list);
	  map1.put("total_reply_no",total_reply_no );
		
	  return map1 ;
	}




	@Override
	public Map category_like_list(Map map) {
		// TODO Auto-generated method stub
		
		List<CarpoolVo> carpool_like_mem_list = carpool_dao.carpool_like_mem_list(map);
		List<MarketVo>	market_like_mem_list  = market_dao.market_like_mem_list(map);
		List<ReviewVo>	review_like_mem_list  = review_dao.review_like_mem_list(map);
		
		int c_l_no = carpool_like_mem_list.size();
		int m_l_no = market_like_mem_list.size();
		int r_l_no = review_like_mem_list.size();
		
		int total_like_no = c_l_no + m_l_no + r_l_no;
		
		Map map1 = new HashMap();
		
		map1.put("review_like_mem_list", review_like_mem_list);
		map1.put("market_like_mem_list", market_like_mem_list);
		map1.put("carpool_like_mem_list", carpool_like_mem_list);
		map1.put("total_like_no", total_like_no);
		
		return map1;
	}




	
}
