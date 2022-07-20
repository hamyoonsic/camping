package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.CarpoolDao;
import dao.MarketDao;
import dao.ReviewDao;

public class TotalSearchServiceImpl implements TotalSearchService {

	CarpoolDao carpool_dao;
	MarketDao market_dao;
	ReviewDao review_dao;
	
	
	public TotalSearchServiceImpl() {
		super();
	}

	public TotalSearchServiceImpl(CarpoolDao carpool_dao, MarketDao market_dao, ReviewDao review_dao) {
		super();
		this.carpool_dao = carpool_dao;
		this.market_dao = market_dao;
		this.review_dao = review_dao;
	}
	
	/*
	 * @Override public Map list() { // TODO Auto-generated method stub
	 * 
	 * List carpool_list = carpool_dao.selectList(); List market_list =
	 * market_dao.selectList(); List review_list = review_dao.selectList();
	 * 
	 * Map map = new HashMap();
	 * 
	 * map.put("carpool_list", carpool_list); map.put("market_list", market_list);
	 * map.put("review_list", review_list);
	 * 
	 * 
	 * return map; }
	 */
	@Override
	public Map list(String search_text) {
		// TODO Auto-generated method stub
		List carpool_list = carpool_dao.selectList(search_text);
		List market_list = market_dao.selectList(search_text);
		List review_list = review_dao.selectList(search_text);
		
		Map map1 = new HashMap();
		
		map1.put("carpool_list", carpool_list);
		map1.put("market_list", market_list);
		map1.put("review_list", review_list);
	
		
		return map1;
	}
	
}
