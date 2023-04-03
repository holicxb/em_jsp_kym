package vo;

public class GogekVO {
	private int gobun, godam; // 고객번호, 담당자 번호
	private String goname, goaddr, gojumin;// 이름, 주소, 주민번호
	
	public int getGobun() {
		return gobun;
	}
	public void setGobun(int gobun) {
		this.gobun = gobun;
	}
	public String getGoname() {
		return goname;
	}
	public void setGoname(String goname) {
		this.goname = goname;
	}
	public String getGoaddr() {
		return goaddr;
	}
	public void setGoaddr(String goaddr) {
		this.goaddr = goaddr;
	}
	public String getGojumin() {
		return gojumin;
	}
	public void setGojumin(String gojumin) {
		this.gojumin = gojumin;
	}
	public int getGodam() {
		return godam;
	}
	public void setGodam(int godam) {
		this.godam = godam;
	}
	
}
