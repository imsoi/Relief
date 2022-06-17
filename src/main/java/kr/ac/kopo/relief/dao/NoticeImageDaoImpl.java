package kr.ac.kopo.relief.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.relief.model.NoticeImage;

@Repository
public class NoticeImageDaoImpl implements NoticeImageDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void add(NoticeImage image) {
		sql.insert("notice_image.add", image);
		
	}

	@Override
	public boolean delete(int icode) {
		if(sql.delete("notice_image.delete", icode) > 0)
			return true;
		else
			return false;
	}

}
