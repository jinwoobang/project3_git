package com.bjw.board;

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
	public List<BoardBean> selectBoard() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectBoard();
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
		
}
