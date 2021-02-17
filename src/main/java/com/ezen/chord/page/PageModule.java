package com.ezen.chord.page;

public class PageModule {

	public static String makePage(String pagename, int cp, int totalCnt, int listSize, int pageSize) {
		
		StringBuffer sb = new StringBuffer();

		int totalPage=(totalCnt/listSize)+1;//총 페이지
		if(totalCnt%listSize==0){
			totalPage--;
		}

		int userGroup=cp/pageSize; //현재 페이지그룹 번호
		if(cp%pageSize==0){
			userGroup--;
		}
		
		if(userGroup!=0){
			//앞으로 꺽괄호 
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("'>&lt;&lt;</a>");
		}

		for(int i=(userGroup*pageSize)+1 ; i<=(userGroup*pageSize)+pageSize ; i++){
			
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			

			if(i==totalPage){ //현재 위치가 totalpage와 같다면 마지막페이지로써 출력되도록
				break;
			}
		}

		if( userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0)) ){

			// 뒤로 꺽괄호 
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("'>&gt;&gt;</a>");
	

		}
		return sb.toString();

	}
}

