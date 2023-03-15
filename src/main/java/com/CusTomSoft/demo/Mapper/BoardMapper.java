package com.CusTomSoft.demo.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.CusTomSoft.demo.VO.BoardVO;

@Mapper
public interface BoardMapper {

	List<BoardVO> boardList();
	
	public BoardVO detail(int board_seq);
	
	public void write(BoardVO vo);
}
