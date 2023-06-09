package com.CusTomSoft.demo.Service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.CusTomSoft.demo.Mapper.BoardMapper;
import com.CusTomSoft.demo.VO.BoardVO;
import com.CusTomSoft.demo.VO.Criteria;

@Service
@Repository
public class BoardServiceImpl implements BoardService {
	
	@Autowired(required = false)
	BoardMapper bm;
	
	// 페이징 처리 전 게시물 가져오기
	/*
    @Override public List<BoardVO> boardList() {
    
    	return bm.boardList(); 
    }
	 */

	@Override
	public BoardVO detail(int board_seq) {
		
		return bm.detail(board_seq);
	}

	@Override
	public void write(BoardVO vo) {
		
		bm.write(vo);
		
	}

	@Override
	public int boardListCnt() {
		
		return bm.boardListCnt();
	}

	@Override
	public List<Map<String, Object>> boardList(Criteria cri) throws Exception{
		
		return bm.boardList(cri);
	}

	@Override
	public List<BoardVO> search(BoardVO vo) {
		
		return bm.search(vo);
		
	}

	@Override
	public BoardVO modify(int board_seq) {
		
		return bm.modify(board_seq);
	}

	@Override
	public void modifybtn(BoardVO vo) {
		
		bm.modifybtn(vo);
		
	}

	@Override
	public void delete(List<String> check) {
		
		System.out.println("삭제 게시물 SEQ 번호 =="+ check);
		
		bm.delete(check);
		
	}

	

}
