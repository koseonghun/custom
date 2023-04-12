package com.CusTomSoft.demo.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.CusTomSoft.demo.VO.UserVO;

@Mapper
public interface UserMapper {
	
	public void signup(UserVO vo);
	
	public UserVO login(UserVO vo);
	
	public int idcheck(String id);

	public List<UserVO> jqgrid();
	
}
