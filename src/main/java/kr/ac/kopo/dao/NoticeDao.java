package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Notice;

public interface NoticeDao {

	List<Notice> list();

	void add(Notice item);

	Notice item(int ncode);

	void update(Notice item);

	void delete(int ncode);

}
