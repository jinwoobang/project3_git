package com.bjw.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDao dao;

	@Override
	public void insertBoard(BoardBean bean) throws Exception {
		dao.insertBoard(bean);
		
	}

	@Override
	public List<BoardBean> selectBoard(int start,int end) throws Exception {
		HashMap<String, Integer>map=new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		return dao.selectBoard(map);
	}

	@Override
	public void deleteBoard(int no) throws Exception {
		dao.deleteBoard(no);
		
	}

	@Override
	public BoardBean selectInfo(int no) throws Exception {
		return dao.selectInfo(no);
	}

	@Override
	public void updateHitBoard(int no) throws Exception {
		dao.updateHitBoard(no);
	}

	@Override
	public void modifyBoard(BoardBean bean) throws Exception {
		dao.modifyBoard(bean);
	}

	@Override
	public List<BoardBean> newOrder() throws Exception {
		return dao.newOrder();
	}

	@Override
	public List<BoardBean> oldOrder() throws Exception {
		return dao.oldOrder();
	}

	@Override
	public List<BoardBean> searchBoard(String search,String query) throws Exception {
		// TODO Auto-generated method stub
		/*return dao.searchBoard(search);*/
		return dao.searchBoard(search, query);
	}
	
	@Override
   public PageBean pageing (String page) {
	   int pageScale=3; // 한페이지 들어가는 게시글 숫자
		int currentPage=1; // 현재 페이지
		int blockScale=3; // <1 2 3> 한번에 보여질 페이징 개수
	
		int totalRow=dao.replyTotalRow(); //총 행의 갯수(게시글 갯수)
		System.out.println(totalRow);
		int totalPage=totalRow%pageScale==0?(totalRow/pageScale):(totalRow/pageScale)+1; //총 페이지 개수
		if(totalRow==0)totalPage=1; // 아무 게시글도 없을 경우 1페이지 보여주기
		String tempPage= page; // 파람으로 받아온 현재페이지
		if(tempPage==null)tempPage="1"; // 현재 페이지 정보 없을 경우 1저장
		
		currentPage=Integer.parseInt(tempPage); // 현재 페이지 정보 저장 
		
		int start=1+(currentPage-1)*pageScale; // 페이지 첫번째 게시글 번호
		int end=pageScale+(currentPage-1)*pageScale; // 마지막 게시글 번호
		
		//현재 페이지 범위 구간
		//int currentBlock=currentPage%pageScale==0?(currentPage/pageScale):(currentPage/pageScale)+1;
		int currentBlock=currentPage%blockScale==0?(currentPage/blockScale):(currentPage/blockScale)+1;
		
		int startPage=1+(currentBlock-1)*blockScale;
		//int startPage=1+(currentBlock-1)*pageScale;
		
		int endPage=blockScale+(currentBlock-1)*blockScale;
		//int endPage=pageScale+(currentBlock-1)*pageScale;
		
		if(endPage>=totalPage){
			endPage=totalPage;
		}
		HashMap<String, Object>map=new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		PageBean pageBean = new PageBean(totalPage, currentBlock, startPage, endPage, currentPage, start , end);
		System.out.println(pageBean.toString());
	   return pageBean;
   }
		
}
