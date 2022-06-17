package kr.ac.kopo.relief.service;

import java.util.List;

import kr.ac.kopo.relief.model.Notice;
import kr.ac.kopo.relief.util.Pager;

public interface NoticeService {

	List<Notice> list(Pager pager);

	void add(Notice item);

	Notice item(int ncode);

	void update(Notice item);

	void delete(int ncode);

	boolean deleteImage(int code);

}
