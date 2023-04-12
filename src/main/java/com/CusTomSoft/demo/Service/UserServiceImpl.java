package com.CusTomSoft.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.CusTomSoft.demo.Mapper.UserMapper;
import com.CusTomSoft.demo.VO.UserVO;

@Service
@Repository
public class UserServiceImpl implements UserService {
	
	@Autowired(required=false)
	UserMapper um;
	
	@Override
	public void signup(UserVO vo) {
		System.out.println("service!!!!!!"+vo);
		um.signup(vo);
	}
	
	@Override
	public UserVO login(UserVO vo) {
		System.out.println("service!!!!"+vo);
		
		return um.login(vo);
	}

	@Override
	public int idcheck(String id) {
		
		return um.idcheck(id);
	}

	@Override
	public List<UserVO> jqgrid() {
		
		return um.jqgrid();
	}
	
	

}
