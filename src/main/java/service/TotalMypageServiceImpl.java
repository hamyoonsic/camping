package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.CarpoolDao;
import dao.MarketDao;
import dao.ReviewDao;

public class TotalMypageServiceImpl implements TotalMypageService {

	CarpoolDao carpool_dao;
	MarketDao market_dao;
	ReviewDao review_dao;
	




	public TotalMypageServiceImpl() {
	}



	public TotalMypageServiceImpl(CarpoolDao carpool_dao, MarketDao market_dao, ReviewDao review_dao) {
		this.carpool_dao = carpool_dao;
		this.market_dao = market_dao;
		this.review_dao = review_dao;
	}






	@Override
	   public Map category_list(int mem_idx) {
	      // TODO Auto-generated method stub
	      
	      List carpool_mem_list =carpool_dao.carpool_mem_list(mem_idx);
	      List market_mem_list  =market_dao.market_mem_list(mem_idx);
	      List review_mem_list    =review_dao.review_mem_list(mem_idx);
	      
	      Map map2 = new HashMap();
	      
	      map2.put("carpool_mem_list",carpool_mem_list);
	      map2.put("market_mem_list", market_mem_list);
	      map2.put("review_mem_list", review_mem_list);
	      
	      return map2;
	   }
	
	
}
