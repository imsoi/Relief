package kr.ac.kopo.relief.util;

import java.util.ArrayList;
import java.util.List;

public class Pager {
	private int page = 1;
	private int perPage = 8;
	private int perGroup = 5;
	private float total;
	
	private int search = 0;
	private String keyword;
	
	public String getQuery() {
		if(search < 1)
			return null;
			
		return "search=" + search + "&keyword=" + keyword;
	}
	
	public int getSearch() {
		return search;
	}

	public void setSearch(int search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPrev() {
		return page <= perGroup ? 1 : (((page - 1) / perGroup) - 1) * perGroup + 1;
	}
	
	public int getNext() {
		int next = (((page - 1) / perGroup) + 1) * perGroup + 1;
		int last = getLast();
		
		return next < last ? next : last;
	}
	/**
	     int startPage = ((page - 1) / perGroup) * perGroup + 1; //startPage라는 이름의 변수를 선언하고 그 값은 수식을 이용하여 지정한다
	     
	     for(int index=startPage; index < (startPage + perGroup) && index <= getLast(); index++) //조건에 도달할때까지 반복하는 for반복문이다
	        list.add(index); //add메소드를 이용하여 index값을 list배열에 추가한다
	     
	     if(list.isEmpty()) { //특정한 조건이 참일경우 실행되는 if문법이다
	        list.add(1); //add메소드를 이용하여 list배열에 '1'을 추가해준다
	     }
	     
	     return list;
	  }
	 */
	public List<Integer> getList() {
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		int startPage = ((page - 1) / perGroup) * perGroup + 1;
		
		for(int index=startPage; index < (startPage + perGroup) && index <= getLast(); index++)
			list.add(index);
		
		if(list.isEmpty())
			list.add(1);
		
		return list;
	}
	
	public int getLast() {
		int last = (int) Math.ceil(total / perPage);
		
		return last < 1 ? 1 : last;
	}
	
	public int getPerGroup() {
		return perGroup;
	}

	public void setPerGroup(int perGroup) {
		this.perGroup = perGroup;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public int getOffset() {
		return (page - 1) * perPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

}
