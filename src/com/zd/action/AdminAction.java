package com.zd.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.zd.model.Admin;
import com.zd.model.Category;
import com.zd.model.Orders;
import com.zd.model.Product;
import com.zd.model.User;
import com.zd.model.vo.Condition;
import com.zd.model.vo.PageBean;
import com.zd.service.IAdminService;

@Controller
public class AdminAction {

	@Autowired
	private IAdminService uService;

	// 转到admin登录页面
	@RequestMapping(value = "/admin/adminLoginindex.action")
	public String tologin() {

		return "adminLoginindex";
	}

	// 转到首页
	@RequestMapping(value = "/index.action")
	public String toindex() {
		return "index";
	}

	// admin登录
	@RequestMapping(value = "/admin/adminLogin.action")
	public String dologin(Admin admin, HttpSession session, HttpServletRequest request) throws IOException, ServletException {
		// 获得表单数据
		String checkcode = request.getParameter("checkcode");
		// 通过session域对象
		Object word = request.getSession().getAttribute("word");
		Admin findAdmin = uService.findAdmin(admin);
		if (checkcode != null && !"".equals(checkcode)) {
			if (checkcode.equals(word)) { // 验证码正确，判断用户名密码是否正确
				if (findAdmin != null) {
					session.setAttribute("admin", findAdmin);
					return "system";
				} else {
					// 用户名密码错误 转发到adminLogin.jsp页面继续登录
					request.setAttribute("message", "用户名或密码错误");
					return "adminLoginindex";
				}
			} else {// 验证码不正确
				request.setAttribute("message", "验证码错误！");
				return "adminLoginindex";
			}
		} else {
			request.setAttribute("message", "请输入验证码！");
			return "adminLoginindex";
		}
	}
	
	
	//转到商品管理页面（分页）
	@RequestMapping(value="/admin/adminProductList")
	public String toadminProductList(HttpServletRequest request,HttpServletResponse response,
			HttpSession session){
		/*
		 * 要想实现分页的功能，就必须获得这五项数据:这五项数据将被封装进pagebaen对象中，在各层间传递 
		 * 当前页 currentPage 该数据从客户端获得 //1表示第一页 
		 * 每页显示的条数 currentCount 该数据也从客户端获得 目前我们在这写死 12条 
		 * 数据总条数totalCount 
		 * 总页数 totalPage 
		 * 当前页上的数据 pageData
		 */

		// 获得表单的数据currentPage
		String currentPage = request.getParameter("currentPage");
		int currentPageInt = 1;
		if (currentPage != null && !"".equals(currentPage)) {
			currentPageInt = Integer.parseInt(currentPage);
		}
		// 设置每页显示的数据条数
		int currentCount = 8;
		
		// 传递业务 得到pageBean对象
		PageBean<Product> pageBean = uService.findProductByPageBean(currentPageInt, currentCount);
		
		// 查询商品分类信息
		List<Category> category = uService.findCategory();

		// 封装数据到域对象
		session.setAttribute("category", category);
		request.setAttribute("pageBean", pageBean);
		
		return "showProductList";
	}
	
	//转到添加商品页面
	@RequestMapping(value="/admin/adminAddCategory")
	public String adminAddCategory(HttpSession session){
		//获得商品分类信息
		List<Category> category = uService.findCategory();
		session.setAttribute("categorylist", category);
		return "addproduct";
	}
	
	//添加商品分类
	@RequestMapping(value="/admin/adminAddProduct")
	public String adminAddProduct(@RequestParam("file")MultipartFile file,Product product,HttpServletRequest request) throws IllegalStateException, IOException{
		product.setPid(UUID.randomUUID().toString());
		//product.setPimage("products/1/c_0014.jpg");
		// 上传文件
		String path = request.getSession().getServletContext().getRealPath("/images/products/1");
		System.out.println(path);
		String fileName = file.getOriginalFilename();
		File dir = new File(path, fileName);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		// MultipartFile自带的解析方法
		file.transferTo(dir);
		product.setPimage("products/1/"+product.getPimage());
		product.setPflag(1);
		product.setPdate(new Date());
		uService.addProduct(product);
		request.setAttribute("message", "添加成功！");
		return "addproduct";
	}
	
	
	//通过pid删除商品
	@RequestMapping(value="/admin/adminDeleteProduct/{pid}")
	public String deleteProduct(@PathVariable("pid") String pid){
		
		Product product = new Product();
		product.setPid(pid);
		uService.deleteProductBypid(product);
		return "redirect:/admin/adminProductList";
	}
	
	//编辑商品信息
	@RequestMapping(value="/admin/adminShowEditProduct/{pid}")
	public String showEditProduct(@PathVariable("pid") String pid,HttpServletRequest request){
		
		Product product = new Product();
		product.setPid(pid);
		Product findproduct = uService.findProductByPid(product);
		
		// 查询商品分类信息
		List<Category> category = uService.findCategory();
		
		request.setAttribute("product", findproduct);
		request.setAttribute("category", category);
		return "editproduct";
	}
	
	//编辑商品
	@RequestMapping(value="/admin/adminEditProduct")
	public String adminEditProduct(Product product){
		System.out.println(product.getPid());
		//手动封装数据
		product.setPdate(new Date());
		//product.setPimage("products/1/c_0014.jpg");
		uService.updateProduct(product);
		return "redirect:/admin/adminProductList";
	}
	
	//通过条件查询商品列表
	@RequestMapping(value="/admin/adminSearchProductList")
	public String searchProductList(Condition condition,HttpServletRequest request){
		List<Product> findProducts = uService.searchProduct(condition);
		request.setAttribute("productlist", findProducts);
		return "searchProduct";
	}
	
	//返回
	@RequestMapping(value="/admin/fanhui")
	public String fanhui(){
		return "redirect:/admin/adminProductList";
	}
	
	//删除所选商品
	@RequestMapping(value="/admin/adminDeleteAllProduct")
	public String deleteAllProduct(HttpServletRequest request){
		String[] proValues = request.getParameterValues("checkOne");
		uService.deleteProduct(proValues);
		return "redirect:/admin/adminProductList";
	}
	
	
	//==========================商品分类管理=========================
	//获得商品分类信息
	@RequestMapping(value="/admin/adminCategoryList")
	public String findCategory(HttpServletRequest request){
		List<Category> findCategory = uService.findCategory();
		request.setAttribute("category", findCategory);
		return "adminCategory";
	}
	
	//转到添加分类页面
	@RequestMapping(value="/admin/toCategory")
	public String toCategory(){
		return "addCategory";
	}
	
	//添加分类
	@RequestMapping(value="/admin/addCategory")
	public String addCategory(Category category,HttpServletRequest request){
		category.setCid(UUID.randomUUID().toString());
		uService.addCategory(category);
		request.setAttribute("message", "添加成功！");
		return "addCategory";
	}
	
	//返回
	@RequestMapping(value="/admin/fanhuiCategory")
	public String fanhuiCategory(){
		return "redirect:/admin/adminCategoryList";
	}
	
	//通过cid删除分类
	@RequestMapping(value="/admin/adminDeleteCategory/{cid}")
	public String deleteCategoryByCid(@PathVariable("cid") String cid){
		Category category = new Category();
		category.setCid(cid);
		uService.deleteCategoryByCid(category);
		return "redirect:/admin/adminCategoryList";
	}
	
	//删除所选分类
	@RequestMapping(value="/admin/deleteCategory")
	public String deleteCategory(HttpServletRequest request){
		String[] cidValues = request.getParameterValues("checkOne");
		uService.deleteAllCategory(cidValues);
		return "redirect:/admin/adminCategoryList";
	}
	
	
	//===========================用户管理模块==============================
	//转到用户列表页面
	@RequestMapping(value="/admin/adminUserList")
	public String toUserList(HttpServletRequest request){
		List<User> findUsers = uService.findUserList();
		request.setAttribute("userlist", findUsers);
		return "adminUser";
	}
	
	//通过uid删除用户
	@RequestMapping(value="/admin/adminDeleteUser/{uid}")
	public String deleteUserByUid(@PathVariable("uid") String uid){
		User user = new User();
		user.setUid(uid);
		uService.deleteUserByUid(user);
		return "redirect:/admin/adminUserList";
	}
	
	//删除所选的用户
	@RequestMapping(value="/admin/deleteUser")
	public String deleteUser(HttpServletRequest request){
		String[] userValues = request.getParameterValues("checkOne");
		uService.deleteUser(userValues);
		return "redirect:/admin/adminUserList";
	}
	
	//=========================订单管理模块==============================
	//转到订单列表页面
	@RequestMapping(value="/admin/adminOrderList")
	public String toOrderList(HttpServletRequest request){
		List<Orders> findOrders = uService.findOrderList();
		request.setAttribute("orderlist", findOrders);
		return "adminOrders";
	}
	
	//通过oid删除订单
	@RequestMapping(value="/admin/adminDeleteOrder/{oid}")
	public String deleteOrderByOid(@PathVariable("oid") String oid){
		Orders order = new Orders();
		order.setOid(oid);
		uService.deleteOrderByOid(order);
		return "redirect:/admin/adminOrderList";
	}
	
	//删除所选的订单
	@RequestMapping(value="/admin/deleteOrder")
	public String deleteOrders(HttpServletRequest request){
		String[] orderValues = request.getParameterValues("checkOne");
		uService.deleteOrders(orderValues);
		return "redirect:/admin/adminOrderList";
	}
}
