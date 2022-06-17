package kr.ac.kopo.relief.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.relief.dao.NoticeDao;
import kr.ac.kopo.relief.dao.NoticeImageDao;
import kr.ac.kopo.relief.model.Notice;
import kr.ac.kopo.relief.model.NoticeImage;
import kr.ac.kopo.relief.util.Pager;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao dao;
	
	@Autowired
	NoticeImageDao noticeImageDao;
	
	@Override
	public List<Notice> list(Pager pager) {
		if(pager.getKeyword() != null)
			pager.setSearch(1);
		else
			pager.setSearch(0);
		
		int total = dao.total(pager);
		pager.setTotal(total);
		
		return dao.list(pager); 
	}

	@Override
	@Transactional//트랜잭션 하는번 1.루트 컨텍스트에 트랜잭션 매니저 빈 등록 2.트래잭션 스키마 등록, 트랜잭션 어노태이션annotation 드라이브 등록한다
	//3.트랜잭션 해야하는 메소드 위에 트랜잭션@달기 그럼 스프링이 알아서 처리
	public void add(Notice item) {
		dao.add(item);//prdouct.xml에서 selectkey라는 명령을 써서 id=code니깐 code의 정수값을 set해준다
		//그래서 위에 item객체에 들어가있는다
		
		if(item.getImages() != null) {
			for(NoticeImage image : item.getImages()) {
				image.setNoticeNcode(item.getNcode());//위에 item code값 넣은걸 가져온다
				// prodect_code를 가져오기 함이다
				noticeImageDao.add(image);
		}
	}
	}

	@Override
	public Notice item(int ncode) {
		return dao.item(ncode);
		
	}

	@Override
	@Transactional
	public void update(Notice item) {
		dao.update(item);
		
		if(item.getImages() != null)
			for(NoticeImage image : item.getImages()) {
				image.setNoticeNcode(item.getNcode());
				
				noticeImageDao.add(image);
			}
	}
	@Override
	@Transactional
	public void delete(int ncode) {
		Notice item = dao.item(ncode);
		
		for(NoticeImage image : item.getImages())
			noticeImageDao.delete(image.getNoticeNcode());
		
		dao.delete(ncode);
	}

	@Override
	public boolean deleteImage(int icode) {
		return noticeImageDao.delete(icode);
	}

}
