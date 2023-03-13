package com.CusTomSoft.demo.Mapper;

import org.apache.ibatis.annotations.Mapper;

import com.CusTomSoft.demo.VO.UserVO;

@Mapper
public interface UserMapper {
	
	public void signup(UserVO vo);
	
	public UserVO login(UserVO vo);
	
	public int idcheck(String id);
	
}
