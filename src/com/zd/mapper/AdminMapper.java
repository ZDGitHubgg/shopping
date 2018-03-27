package com.zd.mapper;

import java.util.List;

import com.zd.model.Admin;
import com.zd.model.Category;
import com.zd.model.Orders;
import com.zd.model.Product;
import com.zd.model.User;
import com.zd.model.vo.Condition;
import com.zd.model.vo.PageBean;

public interface AdminMapper {

	// 验证用户
	Admin findAdmin(Admin admin);

	// 获得商品总条数
	Integer findProductTotalCount();

	// pageData
	List<Product> findPageBean(PageBean<Product> pageBean);
	
	// 分页
	void findProductByPageBean(int currentPageInt, int currentCount);
	
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
	List<Product> findProductLsitBySearch(Condition condition);
	
	//添加分类
	void addCategory(Category category);
	
	//删除所选分类
	void deleteCategoryByCid(Category category);
	
	//查询所有用户
	List<User> selectUserList();
	
	//通过uid删除用户
	void deleteUserByUid(User user);
	
	//查询所有订单
	List<Orders> findOrderList();
	
	//通过oid删除订单
	void deleteOrderByOid(Orders order);

}
