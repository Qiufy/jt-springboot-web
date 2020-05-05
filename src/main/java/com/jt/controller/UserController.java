package com.jt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jt.pojo.User;
import com.jt.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 要求:
	 * 	 url:localhost:8090/findAll
	 * 跳转到userList.jsp中.要求页面中展现数据库数据
	 * 页面取值:${userList}
	 */
	
	@RequestMapping("/findAll")
	public String findAll(Model model) {
		
		List<User> userList = userService.findAll();
		model.addAttribute("userList", userList);
		//model操作的是request域
		//ModelAndView view = new ModelAndView("userList");
		//view.addObject("userList", userList);
		return "userList";
	}
	
	
	/**
	 * 跳转到ajax页面
	 */
	@RequestMapping("/toAjax")
	public String toAjax() {
		
		return "ajax";
	}
	
	/**
	 * 接收ajax请求
	 * url:http://localhost:8090/findAll-ajax
	 * data: null
	 * 返回值: userList的json数据
	 */
	@RequestMapping("findAll-ajax")
	@ResponseBody	//返回json串
	public List<User> findAll_ajax(){
		
		return userService.findAll();
	}
	
}	
