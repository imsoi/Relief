package kr.ac.kopo.relief.dao;

import kr.ac.kopo.relief.model.NoticeImage;

public interface NoticeImageDao {

	void add(NoticeImage image);
	boolean delete(int icode);
}
