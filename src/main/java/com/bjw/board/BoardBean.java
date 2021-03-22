package com.bjw.board;

public class BoardBean {

	private int no;
	private String title;
	private String writer;
	private String contents;
	private String filename;
	private String regdate;
	private int hit;
	private String search;
	
	
	public BoardBean() {
		super();
	}
	
	public BoardBean(int no, String title, String writer, String contents, String filename, String regdate, int hit) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.filename = filename;
		this.regdate = regdate;
		this.hit = hit;
	}

	
	public BoardBean(int no, String title, String writer, String contents, String filename, String regdate, int hit,
			String search) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.filename = filename;
		this.regdate = regdate;
		this.hit = hit;
		this.search = search;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	
	
	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	@Override
	public String toString() {
		return "BoardBean [no=" + no + ", title=" + title + ", writer=" + writer + ", contents=" + contents
				+ ", filename=" + filename + ", regdate=" + regdate + ", hit=" + hit + ", search=" + search + "]";
	}

	

	
	
	
	
}