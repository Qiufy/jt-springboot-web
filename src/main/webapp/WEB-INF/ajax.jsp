<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>AJAX练习</title>
<!--引入js函数类库  -->
<script type="text/javascript" src="/js/jQuery-3.4.1.js"></script>
<!--实现函数调用  -->
<script type="text/javascript">

	//让页面加载完成之后开始运行js
	$(function(){

		//alert("jQuery调用正确!!!!!");
		//常见ajax请求方式 $.get(url,data,callback,type)

		//url:http://localhost:8090/findAll-ajax
		//data:{key:value,key2:value2}
		//callback: function(result/data){xxxxx}
		
		/*处理回调函数  userList~~~~user~~属性*/
		
		$.post("/findAll-ajax1",function(result){
			var tr = null;
			//1.遍历list [user1,user2,user3]
			$(result).each(function(index,user){
				//var user = result[index];
				var id = user.id;
				var name = user.name;
				var age = user.age;
				var sex = user.sex;
				tr += "<tr align='center'><td>"+id+"</td><td>"+name+"</td><td>"+age+"</td><td>"+sex+"</td></tr>";
			});

			//将tr标签添加到table中
			$("#tab").append(tr);
		});


		/*ajax基础版本  
		* data格式常见2种
			1.js格式 {key:value}
			2.字符串格式   表单序列化格式后  
			  $("form").serialize()
			  id=1&name=tom&xxx=xxx
		*/
		$.ajax({
			type: "get",//请求类型
			url:  "/findAll-ajax",
			//data: "{id:100}",   //提交的参数
			dataType: "json",   //返回值类型
			async:  false,		//设定同步异步
			success: function(result){
				alert("回调函数成功时执行!!!");
			},
			error:   function(result){
				alert("当ajax请求报异常时执行");
			} 
		});

		//$.getJSON(url,data,callback){}
		//$.get(url,data,callback,json)
		
		
		
	})
</script>
</head>
<body>
	<table id="tab" border="1px" width="65%" align="center">
		<tr>
			<td colspan="6" align="center"><h3>学生信息</h3></td>
		</tr>
		<tr align="center">
			<th>编号</th>
			<th>姓名</th>
			<th>年龄</th>
			<th>性别</th>
		</tr>
	</table>
</body>
</html>