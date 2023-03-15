package com.CusTomSoft.demo.Service;

import java.util.List;

import com.CusTomSoft.demo.VO.BoardVO;

public interface BoardService {

	List<BoardVO> boardList() throws Exception;
	
	public BoardVO detail(int board_seq);

	public void write(BoardVO vo);

}
