package com.CusTomSoft.demo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public String table(Model model) throws Exception {
		
		List<BoardVO> boardList = bs.boardList();
		model.addAttribute("boardList",boardList);
		
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
		
		System.out.println("Controller!!!!!!!!!!+++"+vo.board_title);
		System.out.println("Controller!!!!!!!!!!+++"+vo.board_text);
		System.out.println("Controller!!!!!!!!!!+++"+vo.board_writer);
		
		return "redirect:boardlist";
	}
	
	@GetMapping("detail")
	public String detail(Model model,int board_seq,BoardVO vo) {
		
		vo.setBoard_seq(board_seq);
		
		BoardVO detail = bs.detail(board_seq);
		model.addAttribute("detail",detail);  
		
		return "detail";
	}
	
	@GetMapping("file")
	public String file(@RequestParam String board_img_path, HttpServletResponse response) throws Exception {
		
		return "";
	}
	
	@GetMapping("jqgrid")
	public String jqgrid() {
		
		return "jqgrid";
	}
	
}
