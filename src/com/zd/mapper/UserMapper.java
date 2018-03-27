package com.zd.mapper;

import java.util.HashMap;
import java.util.List;

import com.zd.model.Orders;
import com.zd.model.Product;
import com.zd.model.User;
import com.zd.model.vo.PageBean;

public interface UserMapper {

	User findUserByName(User user);

	void addUser(User user);

	User findUser(User user);

	int findProtoTalCount();

	List<Product> findfindProPageData(PageBean<Product> pageBean);

	List<Product> findProBySearch(HashMap<String, Object> map);

	int findProToTalCountPhone();

	int findProToTalCountCom();

	int findProToTalCountCloth();

	List<Product> findPro(HashMap<String, Object> map);

	Product findProByPid(String pid);

	void addCart(Orders order);

	List<Orders> findOrdersByUid(String uid);

	int shopAll(String uid);

	void deleteByOid(String oid);

	int shopByOid(String oid);

}
