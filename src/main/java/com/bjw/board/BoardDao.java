package com.bjw.board;

import java.util.HashMap;
import java.util.List;

public interface BoardDao {
	public void insertBoard(BoardBean bean) throws Exception;
	public java.util.List<BoardBean> selectBoard(HashMap<String, Integer> map) throws Exception;
	public void deleteBoard(int no) throws Exception;
	public BoardBean selectInfo(int no) throws Exception;
	public void updateHitBoard(int no) throws Exception;
	public void modifyBoard(BoardBean bean) throws Exception;
	public List<BoardBean> newOrder(int start,int end) throws Exception;
	public List<BoardBean> oldOrder(int start,int end) throws Exception;
	/*public List<BoardBean> searchBoard(String search) throws Exception;*/
	/*public List<BoardBean> searchBoard(String search,String query) throws Exception;*/
	public List<BoardBean> searchBoard(HashMap<String, Object>map) throws Exception;
	public int replyTotalRow();
}
