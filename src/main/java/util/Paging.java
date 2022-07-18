package util;

public class Paging {											  
	public static String getPaging(String pageURL,
			
								   int nowPage, 
								   int rowTotal,
								   int blockList, 
								   int blockPage) {
		
		int totalPage,
            startPage = 0,
            endPage;

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; 
		
		isPrevPage=isNextPage=false;
		totalPage = rowTotal/blockList; 
		
		if(rowTotal%blockList!=0)totalPage++;
		

		if(nowPage > totalPage)nowPage = totalPage;
		
		if(startPage>0) {
		
			startPage = ((nowPage-1)/blockPage)*blockPage+1;
		
		} else if (startPage<=0) {
			
			startPage = 1;
		}
		
			endPage = startPage + blockPage - 1; //
			
			
			if(endPage > totalPage)endPage = totalPage;
			if(endPage < totalPage) isNextPage = true;
			if(startPage > 1)isPrevPage = true;
		
		
		sb = new StringBuffer();

	
			if(isPrevPage){
				sb.append("<a href ='"+pageURL+"?page=");
				sb.append(startPage-1); //현재그룹보다 이전그룹의 마지막페이지로이동
				sb.append("'></a>");
				
			} else {
				
				isPrevPage = false;
			}

		
		
//------페이지 목록 출력 -------------------------------------------------------------------------------------------------

		for(int i=startPage; i<= endPage ;i++){
			
			if(i>totalPage)break;
			if(i<startPage)break;
			
			if(i == nowPage){ //현재 있는 페이지
				sb.append("&nbsp;<a href='"+pageURL+"?page=");
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
			else{//현재 페이지가 아니면
				sb.append("&nbsp;<a href='"+pageURL+"?page=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}// end for
		
		
//-----그룹페이지처리 다음 ----------------------------------------------------------------------------------------------
		for(int i=startPage; i<= endPage ;i++){
			
			if(isNextPage){
				sb.append("<a href ='"+pageURL+"?page=");
				sb.append(endPage+1);
				sb.append("'></a>");
			}
			/*
			 * else sb.append("▶");
			 */
		}

		return sb.toString();
	}
}