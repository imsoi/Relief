package kr.ac.kopo.relief.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.relief.model.Member;
import kr.ac.kopo.relief.service.MemberService;

@Controller
public class RootController {
   
   @Autowired
   MemberService memberService;
   
   @RequestMapping("/")
   public String index() {
      return "index";
   }
   
   @RequestMapping("/introduce")
   public String introduce() {
      return "introduce";
   }
   
   @RequestMapping("/service")
   public String service() {
      return "service";
   }
   
   @GetMapping("/login") 
   public String login() {
      return "login";
   }
   
   @PostMapping("/login")
   public String login(Member member, RedirectAttributes ra, HttpSession session) {
      if(memberService.login(member)) {
         session.setAttribute("member", member);
         return "redirect:.";
      }
      
      ra.addFlashAttribute("msg", "아이디 또는 비밀번호를 확인해주세요");
      
      return "redirect:login";
   }
   
   @GetMapping("/signup")
   public String signup() {
      return "signup";
   }
   
   @PostMapping("/signup")
   public String signup(Member member) {
      memberService.add(member);
      
      return "redirect:.";
   }
   
   @ResponseBody
   @GetMapping("/checkId")
   public String checkId(String id) {
      try {
         Thread.sleep(1*1000);
      } catch (InterruptedException e) {
         e.printStackTrace();
      }
      
      if(memberService.checkId(id))
         return "OK";
      else
         return "FAIL";
   }
   
   @GetMapping("/profile")
   public String profile() {
      return "profile";
   }
   
   @RequestMapping("/logout")
   public String logout(HttpSession session) {
      session.invalidate();
      
      return "redirect:.";
   }
}