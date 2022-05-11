package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Notice;
import kr.ac.kopo.util.Pager;

public interface NoticeDao {

	List<Notice> list(Pager pager);

	void add(Notice item);

	Notice item(int ncode);

	void update(Notice item);

	void delete(int ncode);

	int total(Pager pager);

}
