package kr.ac.kopo.relief.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.relief.model.Member;
import kr.ac.kopo.relief.model.Notice;
import kr.ac.kopo.relief.model.NoticeImage;
import kr.ac.kopo.relief.service.NoticeService;
import kr.ac.kopo.relief.util.Pager;
import kr.ac.kopo.relief.util.Uploader;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	final String path = "notice/";
	
	@Autowired
	NoticeService service;
	
	@GetMapping("/list")
	public String list(Model model, Pager pager, @SessionAttribute Member member) { //${sessionScope.member.grade == 1}하려면 @SessionAttribute 해야함
		List<Notice> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(Notice item, Model model, @RequestParam("NoticeImage") List<MultipartFile> noticeImage) {
		System.out.println(item.getTitle());
		try { // 배열로 받아오는 방식 2가지 : parameter에서 컨트롤러에서 직접 받으려고 하면 @RequestParam("이름을 정확히 주면됨")/ 옆에거를 쓰기 싫으면 Product를 밑으로 내려보내서 필드를 선언하는 방식
	         Uploader<NoticeImage> uploader = new Uploader<>();
	         
	         List<NoticeImage> images = uploader.makeList(noticeImage, NoticeImage.class);
	         
	         item.setImages(images);
	         
	         service.add(item);
	      }catch (Exception e) {
	         e.printStackTrace();
	      }
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{ncode}")
	public String update(@PathVariable int ncode, Model model) {
		Notice item = service.item(ncode);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@PostMapping("/update/{ncode}")
	public String update(@PathVariable int ncode, Notice item) {
		item.setNcode(ncode);
		service.update(item);
		
		return "redirect:../list";
	}
	
	@GetMapping("/delete/{ncode}")
	public String delete(@PathVariable int ncode) {

		service.delete(ncode);
		return "redirect:../list";
	}	

	@GetMapping("/view/{ncode}")
	public String view(@PathVariable int ncode, Model model) {
		
		Notice item = service.item(ncode);

		model.addAttribute("item", item);
		/* System.out.println(item.getImages().get(0).getFilename()); */
		return path + "view";
	}
	
	 @ResponseBody
	 @GetMapping("/image/delete/{icode}")
	 public boolean deleteImage(@PathVariable int icode) {
	      
	    return service.deleteImage(icode);
	 }
	
}
