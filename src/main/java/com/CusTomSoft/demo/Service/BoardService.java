package com.CusTomSoft.demo.Service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.CusTomSoft.demo.VO.BoardVO;
import com.CusTomSoft.demo.VO.Criteria;

public interface BoardService {
	
	// 페이징 처리 전 게시물 가져오기
	//List<BoardVO> boardList() throws Exception;
	
	public BoardVO detail(int board_seq);

	public void write(BoardVO vo);

	public int boardListCnt();

	List<Map<String, Object>> boardList(Criteria cri) throws Exception;

	public List<BoardVO> search(BoardVO vo);

	public BoardVO modify(int board_seq);

	public void modifybtn(BoardVO vo);

	public void delete(List<String> check);
	 
	
}
