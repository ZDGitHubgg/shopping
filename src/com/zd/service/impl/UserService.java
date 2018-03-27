package com.zd.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zd.mapper.UserMapper;
import com.zd.model.Orders;
import com.zd.model.Product;
import com.zd.model.User;
import com.zd.model.vo.PageBean;
import com.zd.service.IUserService;

@Service
public class UserService implements IUserService {
	
	@Autowired
	private UserMapper uMapper;
	
	//通过name查询用户名是否存在
	@Override
	public User findUserByName(User user) {
		return uMapper.findUserByName(user);
	}
	
	
	//添加用户
	@Override
	@Transactional
	public void addUser(User user) {
		uMapper.addUser(user);
	}

	
	//验证用户登录
	@Override
	public User findUser(User user) {
		return uMapper.findUser(user);
	}

	
	//商品分页
	@Override
	public PageBean<Product> findProductByPageBean(int currentPageInt, int currentCount) {
		//获得商品总条数
		int totalCount = uMapper.findProtoTalCount();
		//总页数
		int totalPage = (int) Math.ceil(totalCount/(currentCount*1.0));
		//index
		int index = (currentPageInt-1)*currentCount;
		PageBean<Product> pageBean = new PageBean<>();
		pageBean.setIndex(index);
		pageBean.setCurrentCount(currentCount);
		List<Product> pageData = uMapper.findfindProPageData(pageBean);
		//封装pagebean
		PageBean<Product> pageBean2 = new PageBean<>();
		pageBean2.setCurrentCount(currentCount);
		pageBean2.setCurrentPage(currentPageInt);
		pageBean2.setIndex(index);
		pageBean2.setPageData(pageData);
		pageBean2.setTotalCount(totalCount);
		pageBean2.setTotalPage(totalPage);
		return pageBean2;
	}

	
	//站内搜索
	@Override
	public List<Product> findProBySearch(String word) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("word", word);
		map.put("index", 0);
		map.put("size", 4);
		return uMapper.findProBySearch(map);
	}

	
	//查询手机
	@Override
	public PageBean<Product> findProByPhone(int currentCount, int currentPageInt) {
		int totalCount = uMapper.findProToTalCountPhone();//手机总条数
		int totalPage = (int) Math.ceil(totalCount/(currentCount*1.0));//总页数
		int index = (currentPageInt-1)*currentCount;
		HashMap<String, Object> map = new HashMap<>();
		map.put("index", index);
		map.put("currentCount", currentCount);
		map.put("cid", "1");
		List<Product> pageData = uMapper.findPro(map);
		PageBean<Product> pageBean = new PageBean<>();
		pageBean.setCurrentCount(currentCount);
		pageBean.setCurrentPage(currentPageInt);
		pageBean.setIndex(index);
		pageBean.setPageData(pageData);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}

	
	//查询电脑
	@Override
	public PageBean<Product> findProByCom(int currentCount, int currentPageInt) {
		int totalCount = uMapper.findProToTalCountCom();//电脑总条数
		int totalPage = (int) Math.ceil(totalCount/(currentCount*1.0));//总页数
		int index = (currentPageInt-1)*currentCount;
		HashMap<String, Object> map = new HashMap<>();
		map.put("index", index);
		map.put("currentCount", currentCount);
		map.put("cid", "2");
		List<Product> pageData = uMapper.findPro(map);
		PageBean<Product> pageBean = new PageBean<>();
		pageBean.setCurrentCount(currentCount);
		pageBean.setCurrentPage(currentPageInt);
		pageBean.setIndex(index);
		pageBean.setPageData(pageData);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}

	//查询衣服
	@Override
	public PageBean<Product> findProByCloth(int currentCount, int currentPageInt) {
		int totalCount = uMapper.findProToTalCountCloth();//衣服总条数
		int totalPage = (int) Math.ceil(totalCount/(currentCount*1.0));//总页数
		int index = (currentPageInt-1)*currentCount;
		HashMap<String, Object> map = new HashMap<>();
		map.put("index", index);
		map.put("currentCount", currentCount);
		map.put("cid", "3");
		List<Product> pageData = uMapper.findPro(map);
		PageBean<Product> pageBean = new PageBean<>();
		pageBean.setCurrentCount(currentCount);
		pageBean.setCurrentPage(currentPageInt);
		pageBean.setIndex(index);
		pageBean.setPageData(pageData);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}


	//通过pid查询商品
	@Override
	public Product findProByPid(String pid) {
		return uMapper.findProByPid(pid);
	}


	//添加购物车
	@Override
	@Transactional
	public void addCart(Orders order) {
		uMapper.addCart(order);
	}


	//通过uid查询订单
	@Override
	public List<Orders> findOrdersByUid(String uid) {
		List<Orders> orderlistList = uMapper.findOrdersByUid(uid);
		return orderlistList;
	}


	//购买全部订单
	@Transactional
	@Override
	public int shopAll(String uid) {
		
		return uMapper.shopAll(uid);
	}


	//删除oid订单
	@Transactional
	@Override
	public void deleteByOid(String oid) {
		uMapper.deleteByOid(oid);
	}

	@Transactional
	@Override
	public int shopByOid(String oid) {
		return uMapper.shopByOid(oid);
	}

}
