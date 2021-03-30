package com.bjw.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Inject
	private SqlSession sql;
	private static String namespace="com.bjw.board.mapper";
	
	@Override
	public void insertBoard(BoardBean bean) throws Exception {
		sql.insert(namespace+".insertBoard",bean);
	}

	@Override
	public List<BoardBean> selectBoard(HashMap<String, Integer>map) throws Exception {
		return sql.selectList(namespace+".selectBoard",map);
	}

	@Override
	public void deleteBoard(int no) throws Exception {
		sql.delete(namespace+".deleteBoard",no);	
	}

	@Override
	public BoardBean selectInfo(int no) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".selectInfo",no);
	}

	@Override
	public void updateHitBoard(int no) throws Exception {
		 sql.update(namespace+".updateHitBoard",no);
		
	}

	@Override
	public void modifyBoard(BoardBean bean) throws Exception {
		sql.update(namespace+".modifyBoard",bean);	
	}

	@Override
	public List<BoardBean> newOrder() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".newOrder");
	}

	@Override
	public List<BoardBean> oldOrder() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".oldOrder");
	}

	@Override
	public List<BoardBean> searchBoard(HashMap<String, Object>map) throws Exception {
		/*HashMap<String, Object>map=new HashMap<>();
		map.put("search", search);
		map.put("query", query);*/
		return sql.selectList(namespace+".searchBoard",map);
	}

	@Override
	public int replyTotalRow() {
		return sql.selectOne(namespace+".replyTotalRow");
	}
	
	
	
	
	
}
