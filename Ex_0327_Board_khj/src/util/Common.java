package util;

public class Common {
	// 객체의 페이지 관리를 편하게 하기 위해 생성한 클래스
	// 만약 A, B의 게시판이 존재한다면 두 게시판이
	// 한 페이지당 보여줘야 하는 게시글의 수, 페이지 메뉴 수를 다르게
	// 설정해 두고 가져다 쓸 수 있다.
	public static class Board {
		// 한 체이지에 보여줄 게시글 갯수
		public final static int BLOCKLIST = 5;

		// 한 화면에 보여질 페이지 메뉴 수
		public final static int BLOCKPAGE = 3;
	}

	public static class Notice {
		// 한 체이지에 보여줄 게시글 갯수
		public final static int BLOCKLIST = 10;

		// 한 화면에 보여질 페이지 메뉴 수
		public final static int BLOCKPAGE = 5;
	}
}
