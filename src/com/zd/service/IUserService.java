package com.zd.service;

import java.util.List;

import com.zd.model.Orders;
import com.zd.model.Product;
import com.zd.model.User;
import com.zd.model.vo.PageBean;

public interface IUserService {

	User findUserByName(User user);

	void addUser(User user);

	User findUser(User user);

	PageBean<Product> findProductByPageBean(int currentPageInt, int currentCount);

	List<Product> findProBySearch(String word);

	PageBean<Product> findProByPhone(int currentCount, int currentPageInt);

	PageBean<Product> findProByCom(int currentCount, int currentPageInt);

	PageBean<Product> findProByCloth(int currentCount, int currentPageInt);

	Product findProByPid(String pid);

	void addCart(Orders order);

	List<Orders> findOrdersByUid(String uid);

	int shopAll(String uid);

	void deleteByOid(String oid);

	int shopByOid(String oid);
	
	
}
