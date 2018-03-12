package com.math.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.math.board.BoardDTO;
import com.math.util.ListData;

@Repository
public class ReplyDAO implements QnaDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="QnaMapper.";


	public int replyUpdate(BoardDTO parent) throws Exception{
		return sqlSession.update(NAMESPACE+"replyUpdate", parent);
	}
	
	public int replyInsert(BoardDTO boardDTO,BoardDTO parent) throws Exception{
		Map<String, BoardDTO> map=new HashMap<String, BoardDTO>();
		map.put("board", boardDTO);
		map.put("parent", parent);

		return sqlSession.insert(NAMESPACE+"replyInsert", map);
	}
	public int replyInsert2(BoardDTO boardDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"replyInsert2", boardDTO);
	}

}

