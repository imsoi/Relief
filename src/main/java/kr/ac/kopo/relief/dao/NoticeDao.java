package kr.ac.kopo.relief.dao;

import java.util.List;

import kr.ac.kopo.relief.model.Notice;
import kr.ac.kopo.relief.util.Pager;

public interface NoticeDao {

	List<Notice> list(Pager pager);

	void add(Notice item);

	Notice item(int ncode);

	void update(Notice item);

	void delete(int ncode);

	int total(Pager pager);

}
