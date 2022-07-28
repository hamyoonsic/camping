package controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.TotalSearchService;

@Controller
public class TotalSearchController {

	TotalSearchService total_search_service;

	public TotalSearchController(TotalSearchService total_search_service) {
		super();
		this.total_search_service = total_search_service;
	}
	

	 @RequestMapping("/homepage/total_search_list.do")
	 
	  public String list( @RequestParam(value="search_text",required = false, defaultValue ="null") String search_text,
			  			  Model model) {
	  
	  Map map = total_search_service.list(search_text);
	  
	  model.addAttribute("map", map);
	 
	  return "/homepage/total_search_list";
	
	
	 }
	
	
	
}
