package controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.TotalMypageService;

@Controller
public class TotalMypageController {

	TotalMypageService total_mypage_service;

	 public TotalMypageController(TotalMypageService total_mypage_service) {
		this.total_mypage_service = total_mypage_service;
	}



	@RequestMapping("member/mypage/category_list.do")
     public String category_list(
           int mem_idx, /* @RequestParam(value="page",required=false,defaultValue="1") int nowPage, */
                        Model model) {
        /*
         * int start = (nowPage-1)*MyConstant.Category.BLOCK_LIST + 1; int end = start +
         * MyConstant.Category.BLOCK_LIST - 1;
         */
      
        /*
         * Map map = new HashMap(); map.put("start", start); map.put("end", end);
         * 
         */
        
        
        Map map2 = total_mypage_service.category_list(mem_idx);
        
        model.addAttribute("map2", map2);
      
      
         return "category_list";
   }
  
	
	
	
}
