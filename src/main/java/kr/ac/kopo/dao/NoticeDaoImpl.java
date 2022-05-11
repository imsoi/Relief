package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Notice;
import kr.ac.kopo.util.Pager;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Notice> list(Pager pager) {
		return sql.selectList("notice.list", pager);
	}

	@Override
	public void add(Notice item) {
		sql.insert("notice.add", item);
	}

	@Override
	public Notice item(int ncode) {
		return sql.selectOne("notice.item", ncode);
	}

	@Override
	public void update(Notice item) {
		sql.update("notice.update", item);
	}

	@Override
	public void delete(int ncode) {
		sql.delete("notice.delete", ncode);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("notice.total", pager);
	}

}
