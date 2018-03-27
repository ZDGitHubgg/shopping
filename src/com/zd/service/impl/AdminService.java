package com.zd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zd.mapper.AdminMapper;
import com.zd.model.Admin;
import com.zd.model.Category;
import com.zd.model.Orders;
import com.zd.model.Product;
import com.zd.model.User;
import com.zd.model.vo.Condition;
import com.zd.model.vo.PageBean;
import com.zd.service.IAdminService;

@Service
public class AdminService implements IAdminService {

	@Autowired
	AdminMapper amapper;

	// 通过姓名 密码验证登录
	@Override
	public Admin findAdmin(Admin admin) {
		return amapper.findAdmin(admin);
	}

	// 分页
	// 获得商品总条数
	@Override
	public Integer findProductTotalCount() {
		return amapper.findProductTotalCount();
	}

	// pageData
	@Override
	public List<Product> findPageBean(Integer index, int currentCount) {
		PageBean<Product> pageBean = new PageBean<>();
		pageBean.setIndex(index);
		pageBean.setCurrentCount(currentCount);
		return amapper.findPageBean(pageBean);
	}

	@Override
	public PageBean<Product> findProductByPageBean(int currentPageInt, int currentCount) {
		Integer totalCount = findProductTotalCount();
		
		// 总页数 = Math.ceil(商品总数/每页显式地商品数)
		int totalPage = (int) Math.ceil(totalCount / (currentCount * 1.0));
		// select * from product limit ?,?
		// 起始索引 = （当前页-1）*12
		int index = (currentPageInt - 1) * currentCount;
		List<Product> pageData = findPageBean(index, currentCount);
		//System.out.println(pageData);
		
		// 封装pageBean
		PageBean<Product> pageBean = new PageBean<>();
		pageBean.setCurrentPage(currentPageInt);
		pageBean.setCurrentCount(currentCount);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		pageBean.setPageData(pageData);
		pageBean.setIndex(index);
		return pageBean;
	}
	
	//获得商品分类
	@Override
	public List<Category> findCategory() {
		return amapper.findCategory();
	}
	
	
	//添加商品
	@Override
	@Transactional
	public void addProduct(Product product) {
		amapper.addProduct(product);
	}
	
	//通过pid删除商品
	@Override
	@Transactional
	public void deleteProductBypid(Product product) {
		amapper.deleteProductBypid(product);
	}
	
	//通过pid查询商品
	@Override
	public Product findProductByPid(Product product) {
		
		return amapper.findProductByPid(product);
	}
	
	
	//编辑商品
	@Override
	@Transactional
	public void updateProduct(Product product) {
		amapper.updateProduct(product);
	}
	
	//搜索商品
	@Override
	public List<Product> searchProduct(Condition condition) {
		return amapper.findProductLsitBySearch(condition);
	}
	
	//添加分类
	@Override
	@Transactional
	public void addCategory(Category category) {
		amapper.addCategory(category);
	}
	
	//通过cid删除
	@Override
	@Transactional
	public void deleteCategoryByCid(Category category) {
		amapper.deleteCategoryByCid(category);
	}
	
	
	//删除所选分类
	@Override
	@Transactional
	public void deleteAllCategory(String[] cidValues) {
		Category category = new Category();
		for (String cid : cidValues) {
			category.setCid(cid);
			amapper.deleteCategoryByCid(category);
		}
	}
	
	
	//删除所选商品
	@Override
	@Transactional
	public void deleteProduct(String[] proValues) {
		Product product = new Product();
		for (String pid : proValues) {
			product.setPid(pid);
			amapper.deleteProductBypid(product);
		}
	}
	
	
	
	
	//查询所有用户
	@Override
	public List<User> findUserList() {
		return amapper.selectUserList();
	}
	
	//通过uid删除用户
	@Override
	@Transactional
	public void deleteUserByUid(User user) {
		amapper.deleteUserByUid(user);
	}
	
	//删除所选用户
	@Override
	@Transactional
	public void deleteUser(String[] userValues) {
		for (String uid : userValues) {
			User user = new User();
			user.setUid(uid);
			amapper.deleteUserByUid(user);
		}
	}
	
	
	//查询所有订单
	@Override
	public List<Orders> findOrderList() {
		
		return amapper.findOrderList();
	}
	
	//通过oid删除订单
	@Override
	@Transactional
	public void deleteOrderByOid(Orders order) {
		amapper.deleteOrderByOid(order);
	}
	
	//删除所选的订单
	@Override
	@Transactional
	public void deleteOrders(String[] orderValues) {
		Orders order = new Orders();
		for (String oid : orderValues) {
			order.setOid(oid);
			amapper.deleteOrderByOid(order);
		}
	}

}
