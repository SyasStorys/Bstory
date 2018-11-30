package kr.bstory.board.common;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("BoardVO")
public class BoardVO {
		
	private String brd_seq;
	private String brd_title;
	private String brd_writer;
	private String brd_memo;
	private Date req_date;
	private int brd_hit;
	private char brddeleteflag;
	
	
	public String getBrd_seq() {
		return brd_seq;
	}
	public void setBrd_seq(String brd_seq) {
		this.brd_seq = brd_seq;
	}
	public String getBrd_title() {
		return brd_title;
	}
	public void setBrd_title(String brd_title) {
		this.brd_title = brd_title;
	}
	public String getBrd_writer() {
		return brd_writer;
	}
	public void setBrd_writer(String brd_writer) {
		this.brd_writer = brd_writer;
	}
	public String getBrd_memo() {
		return brd_memo;
	}
	public void setBrd_memo(String brd_memo) {
		this.brd_memo = brd_memo;
	}
	public Date getReq_date() {
		return req_date;
	}
	public void setReq_date(Date req_date) {
		this.req_date = req_date;
	}
	public int getBrd_hit() {
		return brd_hit;
	}
	public void setBrd_hit(int brd_hit) {
		this.brd_hit = brd_hit;
	}
	public char getBrddeleteflag() {
		return brddeleteflag;
	}
	public void setBrddeleteflag(char brddeleteflag) {
		this.brddeleteflag = brddeleteflag;
	} 
	
	
	
}
