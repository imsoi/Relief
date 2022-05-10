package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Notice;

public interface NoticeService {

	List<Notice> list();

	void add(Notice item);

	Notice item(int ncode);

	void update(Notice item);

	void delete(int ncode);

}
