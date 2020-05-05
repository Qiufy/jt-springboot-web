package com.jt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jt.mapper.UserMapper;
import com.jt.pojo.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 查询是全部数据
	 */
	@Override
	public List<User> findAll() {
		//QueryWrapper<User> queryWrapper = new QueryWrapper<User>();
		
		return userMapper.selectList(null);
	}
}
