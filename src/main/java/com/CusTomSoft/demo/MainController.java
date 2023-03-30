package com.CusTomSoft.demo;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CusTomSoft.demo.Service.BoardService;
import com.CusTomSoft.demo.Service.UserService;
import com.CusTomSoft.demo.VO.BoardVO;
import com.CusTomSoft.demo.VO.Criteria;
import com.CusTomSoft.demo.VO.Paging;
import com.CusTomSoft.demo.VO.UserVO;

@Controller
public class MainController {
	
	@Autowired(required=false)
	UserService us;
	
	
	@GetMapping("/")
	public String main() {
		
		return "page-login";
	}
	
	@GetMapping("page-login")
	public String pagelogin(){
		
		return "page-login";
	}
	
	@GetMapping("register")
	public String register() {
		
		
		return "register";
	}
	
	@GetMapping("index")
	public String mainpage() {
		
		return "index";
	}
	
	@PostMapping("signup")
	public String signup(UserVO vo) {
		
		us.signup(vo);
		
		return "redirect:page-login";
	}
	
	@PostMapping("login")
	@ResponseBody
	public UserVO login(@RequestParam String id, @RequestParam String pw,HttpServletRequest request, Model model) {
		
		UserVO vo = new UserVO();
		
		vo.setCustom_user_nick(id);
		vo.setCustom_user_pswd(pw);
		
		UserVO login = us.login(vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("user",login);
		
		return login;
	}
	
	@GetMapping("logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:page-login";
	}
	
	@PostMapping("idcheck")
	@ResponseBody
	public int idcheck(@RequestParam String id) {
		
		int idcheck = us.idcheck(id);
		
		return idcheck;
	}
	
	//게시판 컨트롤러 !
	
	@Autowired(required = false)
	BoardService bs;
	
	@GetMapping("board")
	public String table(Criteria cri,Model model) throws Exception {
		  
		// 페이징 처리 전 게시물 가져오기
		//List<BoardVO> boardList = bs.boardList();
		
		//전체 게시물 갯수
		int boardListCnt = bs.boardListCnt();
		
        // 페이징 객체
        Paging paging = new Paging();
        paging.setCri(cri);
        paging.setTotalCount(boardListCnt);    
        
        List<Map<String, Object>> list = bs.boardList(cri);
        
        model.addAttribute("boardlist",list);
        model.addAttribute("paging", paging);   
		
		return "board";
	}
	
	@GetMapping("boardlist")
	public String boardlist() {
		
		return "redirect:board";
		
	}
	
	@GetMapping("writepage")
	public String writepage() {
		
		return "writepage";
	}
	
	@PostMapping("write")
	public String write(BoardVO vo) {
			
		bs.write(vo);
	
		return "redirect:boardlist";
	}
	
	
	@GetMapping("detail")
	public String detail(Model model,int board_seq,BoardVO vo) {
		
		vo.setBoard_seq(board_seq);
		
		BoardVO detail = bs.detail(board_seq);
		model.addAttribute("detail",detail);  
		
		return "detail";
	}
	
	@PostMapping("search")
	@ResponseBody
	public String search(@RequestParam String text) {
		
			bs.search(text);
		
		return "search";
	}
	

	
	@GetMapping("jqgrid")
	public String jqgrid() {
		
		return "jqgrid";
	}
	
	@GetMapping("modify")
	public String modify(Model model,int board_seq) {
		
		BoardVO modify = bs.modify(board_seq);
		model.addAttribute("modify",modify);
		
		return "modify";
	}
	
	@PostMapping("modifybtn")
	public String modifybtn(BoardVO vo) {

		
		bs.modifybtn(vo);
		
		return "redirect:boardlist";
	}
	
	@PostMapping("delete")
	@ResponseBody
	public String delete(HttpServletRequest request) {
		
		
		String[] delete = request.getParameterValues("array");
		int size = delete.length;
		for(int i=0; i<size; i++) {
			bs.delete(delete[i]);
		}
		
		System.out.println(delete+"@$!@!%!%!@!@!!!");
		
		return "redirect:board";
	}
	
	@GetMapping("file")
	public String upload() {
		
		return "redirect:boardlist";
		
	}
	
	@GetMapping("api")
	public String api() {
		
		return "api";
	}
	
}
