package com.zd.model.vo;

import java.util.List;

public class PageBean<T> {
	/*
	 * 要想实现分页的功能，就必须获得这五项数据
	 * 当前页	   currentPage
	 * 每页显示的条数    currentCount
	 * 数据总条数	totalCount
	 * 总页数		totalPage
	 * 当前页上的数据     PageData
	 */
	private int currentPage;
	private int currentCount;
	private int totalCount;
	private int totalPage;
	private List<T> pageData;
	private int index;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getCurrentCount() {
		return currentCount;
	}
	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getPageData() {
		return pageData;
	}
	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	
	
}
