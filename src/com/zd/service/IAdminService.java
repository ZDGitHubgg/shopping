package com.zd.service;

import java.util.List;

import com.zd.model.Admin;
import com.zd.model.Category;
import com.zd.model.Orders;
import com.zd.model.Product;
import com.zd.model.User;
import com.zd.model.vo.Condition;
import com.zd.model.vo.PageBean;

public interface IAdminService {
	
	//通过姓名 密码验证登录
	Admin findAdmin(Admin admin);
	
	/**
	 * 分页
	 * */
	//获得商品总条数
	Integer findProductTotalCount();

	//pageData
	List<Product> findPageBean(Integer index,int currentCount);
	
	//获得PageBean对象
	PageBean<Product> findProductByPageBean(int currentPageInt, int currentCount);
	
	//获得商品分类
	List<Category> findCategory();
	
	//添加商品
	void addProduct(Product product);
	
	//通过pid删除商品
	void deleteProductBypid(Product product);
	
	//通过pid查询商品
	Product findProductByPid(Product product);
	
	//编辑商品
	void updateProduct(Product product);
	
	//搜索商品
	List<Product> searchProduct(Condition condition);
	
	//添加分类
	void addCategory(Category category);
	
	//通过cid删除分类
	void deleteCategoryByCid(Category category);
	
	//删除所选分类
	void deleteAllCategory(String[] cidValues);
	
	//删除所选商品
	void deleteProduct(String[] proValues);
	
	//查询所有用户
	List<User> findUserList();
	
	//通过uid删除用户
	void deleteUserByUid(User user);
	
	//删除所选用户
	void deleteUser(String[] userValues);
	
	//查询所有订单
	List<Orders> findOrderList();
	
	//通过oid删除订单
	void deleteOrderByOid(Orders order);
	
	//删除所选的订单
	void deleteOrders(String[] orderValues);
	
	
}
