package com.CusTomSoft.demo.Service;

import java.util.List;

import com.CusTomSoft.demo.VO.UserVO;

public interface UserService {
	
	public void signup(UserVO vo);
	
	public UserVO login(UserVO vo);

	public int idcheck(String id);

	public List<UserVO> jqgrid();
	
}
