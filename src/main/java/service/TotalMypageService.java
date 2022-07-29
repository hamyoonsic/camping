package service;

import java.util.Map;

public interface TotalMypageService {
	
	 //mem_idx에 해당하는 카테고리별 리스트 
	   Map category_list(Map map);
	  //mem_idx에 해당하는 카테고리별 댓글 리스트
	   Map category_reply_list(Map map);
	  //mem_idx에 해당하는 카테고리별 좋아요 리스트 
	   Map category_like_list(Map map);
	   

}
