package kr.ac.kopo.relief.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.relief.model.NoticeImage;

public class Uploader<T extends UploadFile> {
	final String uploadPath = "d:/upload/";

	public List<T> makeList(List<MultipartFile> files, Class<T> type) throws Exception {
		List<T> result = new ArrayList<>();
		
		for(MultipartFile file : files) {
			if(!file.isEmpty()) {
				String filename = file.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();	
				
				file.transferTo(new File(uploadPath + uuid + "_" + filename));
				
				T item = type.newInstance();
				item.setFilename(filename);
				item.setUuid(uuid);
				
				result.add(item);
				
				//trajaction 트래잭션으로 활용하여 등록하면  다 등록되게 ex)4개사진을 등록하면 4개다 등록되게
				//하나라도 실패시 롤백 다 성공시 commit커밋 전송
				//하는 이유 무결성 보장을 위해
			}
		}
		
		return result;
	}

}
