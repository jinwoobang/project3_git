package com.bjw.board;

public class PageBean {
	   private int totalPage;
	   private int currentBlock;
	   private int startPage;
	   private int endPage;
	   private int currentPage;
	   private int start;
	   private int end;
	   
	   public PageBean() {
	      // TODO Auto-generated constructor stub
	   }
	   
	
	
	
	   public PageBean(int totalPage, int currentBlock, int startPage, int endPage, int currentPage, int start, int end) {
		super();
		this.totalPage = totalPage;
		this.currentBlock = currentBlock;
		this.startPage = startPage;
		this.endPage = endPage;
		this.currentPage = currentPage;
		this.start = start;
		this.end = end;
	}




	public int getStart() {
			return start;
		}
		public void setStart(int start) {
			this.start = start;
		}
		public int getEnd() {
			return end;
		}
		public void setEnd(int end) {
			this.end = end;
		}
		
	   public int getTotalPage() {
	      return totalPage;
	   }
	   public void setTotalPage(int totalPage) {
	      this.totalPage = totalPage;
	   }
	   public int getCurrentBlock() {
	      return currentBlock;
	   }
	   public void setCurrentBlock(int currentBlock) {
	      this.currentBlock = currentBlock;
	   }
	   public int getStartPage() {
	      return startPage;
	   }
	   public void setStartPage(int startPage) {
	      this.startPage = startPage;
	   }
	   public int getEndPage() {
	      return endPage;
	   }
	   public void setEndPage(int endPage) {
	      this.endPage = endPage;
	   }
	   public int getCurrentPage() {
	      return currentPage;
	   }
	   public void setCurrentPage(int currentPage) {
	      this.currentPage = currentPage;
	   }


	@Override
	public String toString() {
		return "PageBean [totalPage=" + totalPage + ", currentBlock=" + currentBlock + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", currentPage=" + currentPage + ", start=" + start + ", end=" + end + "]";
	}
	  
	   
	   
	}