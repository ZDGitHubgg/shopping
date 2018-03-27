package com.zd.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.zd.model.Orders;
import com.zd.model.Product;
import com.zd.model.User;
import com.zd.model.vo.PageBean;
import com.zd.service.IUserService;

@Controller
public class UserAction {
	
	@Autowired
	IUserService uService;
	
	//转到首页
	@RequestMapping("/toindex")
	public String index(){
		return "index";
	}
	
	//转到注册页面
	@RequestMapping("/user/toregister.action")
	public String toRegister(){
		return "register";
	}
	
	//注册用户
	@RequestMapping("/user/register")
	public String register(User user,HttpServletRequest request){
		user.setUid(UUID.randomUUID().toString());
		System.out.println(user.getUid());
		user.setUdate(new Date());
		//通过name查询用户名是否存在
		User findUser = uService.findUserByName(user);
		if(findUser==null){
			//注册成功
			uService.addUser(user);
			request.setAttribute("message", "恭喜你注册成功！");
			return "register";
		}else{
			//用户名存在注册失败
			request.setAttribute("message", "用户名已存在！");
			return "register";
		}
	}
	
	//转到User登录页面
	@RequestMapping("/user/tologinindex.action")
	public String tologin(){
		return "login";
	}
	
	//用户登录
	@RequestMapping("/user/dologin")
	@ResponseBody
	public String dologin(User user,HttpServletRequest request,HttpServletResponse response,
			HttpSession session) throws UnsupportedEncodingException{
		// 获得表单数据
		String checkcode = request.getParameter("checkcode");
		// 通过session域对象
		Object word = request.getSession().getAttribute("word");
		User findUser = uService.findUser(user);
		if (checkcode != null && !"".equals(checkcode)) {
			if (checkcode.equals(word)) { // 验证码正确，判断用户名密码是否正确
				if (findUser!= null) {
					session.setAttribute("user", findUser);
					return "1";
				} else {
					// 用户名密码错误 转发到adminLogin.jsp页面继续登录
					return "0";
				}
			} else {// 验证码不正确
				request.setAttribute("message", "验证码错误！");
				return "2";
			}
		} else {
			request.setAttribute("message", "请输入验证码！");
			return "3";
		}
	}
	
	//退出登录
	@RequestMapping("/user/outlogin")
	public String outLogin(){
		return "index";
	}
	
	//注销
	@RequestMapping("/user/logout")
	public String LogOutputStream(HttpSession session){
		session.invalidate();
		return "redirect:/user/tologinindex.action";
	}
	
	//转到商品页面
	@RequestMapping("/user/showpro")
	public String toProductList(HttpServletRequest request){
		String currentPage = request.getParameter("currentPage");
		int currentPageInt = 1;
		if(currentPage!=null && !currentPage.equals("")){
			currentPageInt = Integer.parseInt(currentPage);
		}
		int currentCount = 12;
		PageBean<Product> pageBean = uService.findProductByPageBean(currentPageInt, currentCount);
		User user = (User) request.getSession().getAttribute("user");
		request.setAttribute("user", user);
		request.setAttribute("pageBean", pageBean);
		return "showproduct";
	}
	
	//查询手机类商品
	@RequestMapping("/user/searchbyphone")
	public String searchByPhone(HttpServletRequest request){
		String currentPage = request.getParameter("currentPage");
		int currentPageInt = 1;
		if(currentPage!=null && !currentPage.equals("")){
			currentPageInt = Integer.parseInt(currentPage);
		}
		int currentCount = 8;
		PageBean<Product> pageBean = uService.findProByPhone(currentCount,currentPageInt);
		request.setAttribute("pageBean", pageBean);
		return "findPhone";
	}
	
	// 查询手机类商品
	@RequestMapping("/user/searchbycom")
	public String searchByCom(HttpServletRequest request) {
		String currentPage = request.getParameter("currentPage");
		int currentPageInt = 1;
		if (currentPage != null && !currentPage.equals("")) {
			currentPageInt = Integer.parseInt(currentPage);
		}
		int currentCount = 8;
		PageBean<Product> pageBean = uService.findProByCom(currentCount, currentPageInt);
		request.setAttribute("pageBean", pageBean);
		return "findCom";
	}
	
	// 查询手机类商品
	@RequestMapping("/user/searchbycloth")
	public String searchByCloth(HttpServletRequest request) {
		String currentPage = request.getParameter("currentPage");
		int currentPageInt = 1;
		if (currentPage != null && !currentPage.equals("")) {
			currentPageInt = Integer.parseInt(currentPage);
		}
		int currentCount = 8;
		PageBean<Product> pageBean = uService.findProByCloth(currentCount, currentPageInt);
		request.setAttribute("pageBean", pageBean);
		return "findCloth";
	}
	
	//站内搜索
	@RequestMapping("/user/search")
	public void search(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		String word = request.getParameter("word");
		System.out.println(word);
		List<Product> findProducts = uService.findProBySearch(word);
		Gson gson = new Gson();
		String json = gson.toJson(findProducts);
		System.out.println(json);
		if(json!=null){
			response.getWriter().write(json);
		}
	}
	
	//进入商品详情页
	@RequestMapping("/user/toprodesc/{pid}")
	public String toProDesc(@PathVariable String pid,HttpServletRequest request,HttpSession session){
		Product product = uService.findProByPid(pid);
		request.setAttribute("product", product);
		return "prodetail";
	}
	
	
	// 加入购物车
	@RequestMapping("/user/addcart/{pid}")
	@ResponseBody
	public String toAddCart(@PathVariable String pid,HttpServletRequest request) {
		String pname = request.getParameter("pname");
		String price_str = request.getParameter("price");
		double price = Double.parseDouble(price_str);
		String number_str = request.getParameter("number");
		int number = Integer.parseInt(number_str);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user!=null&&!"".equals(user)){
			//封装数据
			String userid = user.getUid();
			Orders order = new Orders();
			order.setOid(UUID.randomUUID().toString());
			order.setPname(pname);
			order.setNumber(number);
			order.setPrice(price);
			order.setUserid(userid);
			uService.addCart(order);
			return "0";
		}else{
			return "1";
		}
	}
	
	//查看uid查询购物车
	@RequestMapping("/user/showcart/{userid}")
	public String showCart(@PathVariable("userid")String uid,HttpServletRequest request){
		List<Orders> orders = uService.findOrdersByUid(uid);
		int totalnumber = 0;
		double totalprice = 0;
		for (Orders order : orders) {
			totalnumber = totalnumber+order.getNumber();
			totalprice = totalprice + order.getPrice()* order.getNumber();
		}
		request.setAttribute("orders", orders);
		request.setAttribute("totalnumber", totalnumber);
		request.setAttribute("totalprice", totalprice);
		return "cart";
	}
	
	@ResponseBody
	@RequestMapping("/user/shopAll/{uid}")
	public String shopAll(@PathVariable("uid")String uid){
		int i = 0;
		try {
			i = uService.shopAll(uid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(i!=0){
			return "1";
		}else {
			return "0";
		}
	}
	
	//购买成功页面
	@RequestMapping("/user/success")
	public String success(){
		return "success";
	}
	
	//通过oid删除单个
	@RequestMapping("/user/deleteByOid/{oid}")
	public void deleteByOid(@PathVariable("oid")String oid){
		try {
			uService.deleteByOid(oid);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//购买单个通过oid
	@ResponseBody
	@RequestMapping("/user/shop/{oid}")
	public String shopByOid(@PathVariable("oid")String oid){
		System.out.println(oid);
		int i =0;
		try {
			i = uService.shopByOid(oid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(i!=0){
			return "1";
		}else {
			return "0";
		}
	}
	
}
