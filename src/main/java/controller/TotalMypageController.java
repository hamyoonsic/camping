package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.MyConstant;
import service.TotalMypageService;
import util.Paging;

@Controller
public class TotalMypageController {

	TotalMypageService total_mypage_service;

	 public TotalMypageController(TotalMypageService total_mypage_service) {
		this.total_mypage_service = total_mypage_service;
	}



	@RequestMapping("member/mypage/category_list.do")
     public String category_list(
           int mem_idx,  @RequestParam(value="page",required=false,defaultValue="1") int nowPage, 
                        Model model) {
		
        
         int start = (nowPage-1)*MyConstant.Category.BLOCK_LIST + 1; 
         int end = start + MyConstant.Category.BLOCK_LIST - 1;
        
      
       
          Map map = new HashMap(); 
          map.put("start", start); 
          map.put("end", end);
          map.put("mem_idx", mem_idx);
        
        
        
        Map map1 = total_mypage_service.category_list(map);
        
        int total_no = (int) map1.get("total_no");
        
        
        String pageMenu = Paging.mypage_category_getPaging("my_page.do"
        													, nowPage, 
        													total_no, 
        													end, 
        													total_no);
        
        model.addAttribute("map1", map1);
        model.addAttribute("pageMenu",pageMenu);
      
      
         return "mypage/category_list";
   }
  
	@RequestMapping("member/mypage/category_reply_list.do")
	public String category_reply_list(
			int mem_idx,  @RequestParam(value="page",required=false,defaultValue="1") int nowPage, 
			Model model) {
		
		
		int start = (nowPage-1)*MyConstant.Category.BLOCK_LIST + 1; 
		int end = start + MyConstant.Category.BLOCK_LIST - 1;
		
		
		
		Map map = new HashMap(); 
		map.put("start", start); 
		map.put("end", end);
		map.put("mem_idx", mem_idx);
		
		
		
		Map map1 = total_mypage_service.category_reply_list(map);
		
		int total_reply_no = (int) map1.get("total_reply_no");
				
		
		String pageMenu = Paging.mypage_category_getPaging("my_page.do"
				, nowPage, 
				total_reply_no, 
				end, 
				total_reply_no);
		
		model.addAttribute("map1", map1);
		model.addAttribute("pageMenu",pageMenu);
		
		
		return "mypage/category_reply_list";
	}
	
	@RequestMapping("member/mypage/category_like_list.do")
	public String category_like_list(
			int mem_idx,  @RequestParam(value="page",required=false,defaultValue="1") int nowPage, 
			Model model) {
		/* System.out.println(mem_idx); */
		
		int start = (nowPage-1)*MyConstant.Category.BLOCK_LIST + 1; 
		int end = start + MyConstant.Category.BLOCK_LIST - 1;
		
		
		
		Map map = new HashMap(); 
		map.put("start", start); 
		map.put("end", end);
		map.put("mem_idx", mem_idx);
		
		
		
		Map map1 = total_mypage_service.category_like_list(map);
		
		int total_like_no = (int) map1.get("total_like_no");
		
		
		String pageMenu = Paging.mypage_category_getPaging("my_page.do"
				, nowPage, 
				total_like_no, 
				end, 
				total_like_no);
		
		model.addAttribute("map1", map1);
		model.addAttribute("pageMenu",pageMenu);
		
		
		return "mypage/category_like_list";
	}
	
	
	
	
	
}
