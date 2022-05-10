package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.NoticeDao;
import kr.ac.kopo.model.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao dao;
	
	@Override
	public List<Notice> list() {
		return dao.list();
	}

	@Override
	public void add(Notice item) {
		dao.add(item);	
	}

	@Override
	public Notice item(int ncode) {
		return dao.item(ncode);
	}

	@Override
	public void update(Notice item) {
		dao.update(item);
		
	}

	@Override
	public void delete(int ncode) {
		dao.delete(ncode);
		
	}

}
