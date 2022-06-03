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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.relief.model.Member;
import kr.ac.kopo.relief.model.Notice;
import kr.ac.kopo.relief.service.NoticeService;
import kr.ac.kopo.relief.util.Pager;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	final String path = "notice/";
	
	@Autowired
	NoticeService service;
	
	@GetMapping("/list")
	public String list(Model model, Pager pager, @SessionAttribute Member member) { //@SessionAttribute 해야함
		System.out.println(member.getGrade() + "dfdfdfdffd");
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
		
		model.addAttribute("item", item);
		
		service.add(item);
		
		
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
		
		return path + "view";
	}
}
