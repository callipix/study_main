package kr.or.ddit.freeBoard.controller;

public class PagingTest {
	
	public static void main(String[] args) {
		
		int countList;		// 한 페이지에 보여질 게시물 수
		int countPage;		// 한 화면에 보여질 페이지 수
		int page;			// 현재 페이지 번호
		
		// 총 게시물 수가 25인 게시판의 페이지 수를 구해보자
		int totalCount = 25;
		// countPage = 5 또는 10 일경우
		countPage = 10;
		int totalPage = totalCount / countPage;
		if(totalCount % countPage > 0) {
			totalPage++;
		}
//		System.out.println("총 페이지 번호 : "+totalPage);
		// 하단에 표시될 페이지 번호들 알아내기
		totalCount = 255; countList = 10 ; countPage = 10;
		
		// 먼저 현재 페이지가 5인 경우 보여야 할 페이지번호 : 10 (countPage = 10)
		// 시작 페이지를 계산해보자
		page = 5;
		int startPage = (page - 1) / 10 * 10 + 1;
		int endPage = startPage + countPage - 1;
		for(int i = startPage ; i <= endPage ; i++) {
			/*
			 * System.out.println("시작 페이지 : " + startPage); System.out.println(i);
			 * System.out.println("마지막 페이지 : " + endPage);
			 */
		}
		
		/**
		 페이지 번호가 22인 경우
		 단순계산으로 255개의 게시물이 존재하면 26페이지가 존재하고 22페이지가 있는곳은 21~30페이지의 영역이다
		 하지만 26페이지가 끝이기 때문에 단순하게 21페이지에서 countPage를 더하면 안된다 이런경우에는 마지막페이지를 총 페이지 수로 대체 해주어야 한다
		*/
		page = 22;
		countList = 10;
		countPage = 10;
		totalCount = 255;
		totalPage = totalCount / countPage;
		if(totalCount % countPage > 0) {
			totalPage++;
		}
		if(totalPage < page) {
			page = totalPage;
		}
		
		startPage = (page - 1) / 10 * 10 +1;
		endPage = startPage + countPage -1;
		for(int i = startPage ; i <= endPage ; i++) {
			System.out.println(i);
		}
		// 마지막 페이지 보정
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		System.out.println("총 페이지수 : " + totalPage);
		System.out.println("마지막 페이지 수 " + endPage);
	}

}
