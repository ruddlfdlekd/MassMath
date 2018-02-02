package com.math.notice;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.math.board.BoardDAO;
import com.math.board.BoardDTO;
import com.math.util.ListData;

@Repository
public class NoticeDAO implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	private String namespace ="NoticeMapper.";
	
	public NoticeDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<BoardDTO> selectList(ListData listData) throws Exception {
		return sqlSession.selectList(namespace+"selectList", listData);
	}

	@Override
	public BoardDTO selectOne(int num) throws Exception {
		return sqlSession.selectOne(namespace+"selectOne", num);
	}

	@Override
	public int insert(BoardDTO boardDTO) throws Exception {
		return sqlSession.insert(namespace+"noticeInsert", boardDTO);
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(namespace+"noticeUpdate", boardDTO);
	}

	@Override
	public int delete(int num) throws Exception {
		return sqlSession.delete(namespace+"noticeDelete", num);
	}

	@Override
	public int totalCount(ListData listData) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
