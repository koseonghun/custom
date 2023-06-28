package com.CusTomSoft.demo.Mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.CusTomSoft.demo.VO.BoardVO;
import com.CusTomSoft.demo.VO.Criteria;

@Mapper
public interface BoardMapper {

	public List<Map<String, Object>> boardList(Criteria cri) throws Exception;

	// 페이징 처리 전 게시물 가져오기
	//List<BoardVO> boardList();
	
	public BoardVO detail(int board_seq);
	
	public void write(BoardVO vo);

	public int boardListCnt();

	public List<BoardVO> search(String search);

	public BoardVO modify(int board_seq);

	public void modifybtn(BoardVO vo);

	public void delete(List<String> check);

	public List<BoardVO> search(BoardVO vo);
	
}
