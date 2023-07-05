package com.CusTomSoft.demo;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.CusTomSoft.demo.Service.BoardService;
import com.CusTomSoft.demo.Service.UserService;
import com.CusTomSoft.demo.VO.BoardVO;
import com.CusTomSoft.demo.VO.Criteria;
import com.CusTomSoft.demo.VO.PageMaker;
import com.CusTomSoft.demo.VO.UserVO;

@Controller
public class MainController {

	@Autowired(required = false)
	UserService us;

	@GetMapping("/")
	public String main() {

		return "page-login";
	}

	@GetMapping("page-login")
	public String pagelogin() {

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
	public UserVO login(@RequestParam String id, @RequestParam String pw, HttpServletRequest request, Model model) {

		UserVO vo = new UserVO();

		vo.setCustom_user_nick(id);
		vo.setCustom_user_pswd(pw);

		UserVO login = us.login(vo);

		HttpSession session = request.getSession();
		session.setAttribute("user", login);

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

	// 게시판 컨트롤러 !

	@Autowired(required = false)
	BoardService bs;

	@GetMapping("board")
	public String table(Criteria cri, Model model) throws Exception {

		// 페이징 처리 전 게시물 가져오기
		// List<BoardVO> boardList = bs.boardList();

		// 전체 게시물 갯수
		int boardListCnt = bs.boardListCnt();

		// 페이징 객체
		PageMaker paging = new PageMaker();
		paging.setCri(cri);
		paging.setTotalCount(boardListCnt);

		List<Map<String, Object>> list = bs.boardList(cri);

		model.addAttribute("boardlist", list);
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
	public String write(BoardVO vo) throws IOException {

		// 파일 업로드 처리
		String board_img_path = null;
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {

			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);

			UUID uuid = UUID.randomUUID();
			board_img_path = uuid + "." + ext;

			uploadFile.transferTo(new File("D:\\imageseonghun\\" + board_img_path));

		}
		vo.setBoard_img_path(board_img_path);
		bs.write(vo);

		return "redirect:boardlist";
	}

	@GetMapping("detail")
	public String detail(Model model, int board_seq, BoardVO vo) {

		vo.setBoard_seq(board_seq);

		BoardVO detail = bs.detail(board_seq);
		model.addAttribute("detail", detail);

		return "detail";
	}

	@GetMapping("search")
	@ResponseBody
	public List<BoardVO> search(Criteria cri, @RequestParam String type, @RequestParam String keyword, Model model) {

		BoardVO vo = new BoardVO();
		vo.setType(type);
		vo.setKeyword(keyword);

		return bs.search(vo);
	}

	@GetMapping("jqgrid")
	public String jqgrid() {

		return "jqgrid";
	}

	@GetMapping("modify")
	public String modify(Model model, int board_seq) {

		BoardVO modify = bs.modify(board_seq);
		model.addAttribute("modify", modify);

		return "modify";
	}

	@PostMapping("modifybtn")
	public String modifybtn(BoardVO vo) {

		bs.modifybtn(vo);

		return "redirect:boardlist";
	}

	@GetMapping("delete")
	@ResponseBody
	public void delete(@RequestParam(value = "checkArr[]") List<String> check) {

		bs.delete(check);

	}

	@GetMapping("download")
	public void download(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String filename = request.getParameter("board_img_path");
		String realFilename = "";
		System.out.println(filename);

		try {
			String browser = request.getHeader("User-Agent");
			// 파일 인코딩
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
			} else {
				filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
			}
		} catch (UnsupportedEncodingException ex) {
			System.out.println("UnsupportedEncodingException");
		}
		realFilename = "D:\\imageseonghun\\" + filename;
		System.out.println(realFilename);
		File file1 = new File(realFilename);
		if (!file1.exists()) {
			return;
		}

		// 파일명 지정
		response.setContentType("application/octer-stream");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
		try {
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(realFilename);

			int ncount = 0;
			byte[] bytes = new byte[512];

			while ((ncount = fis.read(bytes)) != -1) {
				os.write(bytes, 0, ncount);
			}
			fis.close();
			os.close();
		} catch (Exception e) {
			System.out.println("FileNotFoundException : " + e);
		}

	}

	@GetMapping("api")
	public String api() {

		return "api";
	}

	@RequestMapping(value = "jqgrid")
	@ResponseBody
	public List<UserVO> jqGrid(UserVO vo, Model model) {

		List<UserVO> dataList = us.jqgrid();
		model.addAttribute("list", dataList);

		return dataList;
	}

	@RequestMapping(value = "test")
	@ResponseBody
	public ModelAndView test(ModelAndView mav) {

		mav.setViewName("test");
		return mav;
	}

}
