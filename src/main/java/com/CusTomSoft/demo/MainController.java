package com.CusTomSoft.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CusTomSoft.demo.Service.UserService;
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
	public UserVO login(@RequestParam String id, @RequestParam String pw) {
		
		UserVO vo = new UserVO();
		
		vo.setCustom_user_nick(id);
		vo.setCustom_user_pswd(pw);
		
		UserVO login = us.login(vo);
		
		return login;
	}
	
	@PostMapping("idcheck")
	@ResponseBody
	public int idcheck(@RequestParam String id) {
		
		int idcheck = us.idcheck(id);
		
		return idcheck;
	}
	
}
