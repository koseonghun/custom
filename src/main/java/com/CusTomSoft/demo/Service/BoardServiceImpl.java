package com.CusTomSoft.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.CusTomSoft.demo.Mapper.BoardMapper;
import com.CusTomSoft.demo.VO.BoardVO;

@Service
@Repository
public class BoardServiceImpl implements BoardService {
	
	@Autowired(required = false)
	BoardMapper bm;
	
	@Override
	public List<BoardVO> boardList() {
		
		return bm.boardList();
	}

	@Override
	public BoardVO detail(int board_seq) {
		
		return bm.detail(board_seq);
	}

	@Override
	public void write(BoardVO vo) {
		
		bm.write(vo);
		
	}



}
