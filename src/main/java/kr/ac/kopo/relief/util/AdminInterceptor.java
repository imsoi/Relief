package kr.ac.kopo.relief.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.kopo.relief.model.Member;

public class AdminInterceptor extends HandlerInterceptorAdapter {

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      HttpSession session = request.getSession();
      
      Member member = (Member) session.getAttribute("member");      
      if(member != null && member.getGrade() == 1) {
         System.out.println("AdminInterceptor: TRUE");
         return true;
      }
   
      System.out.println("AdminInterceptor: FALSE");
      
      if(member != null) {
         String query = request.getQueryString();      
         session.setAttribute("target", request.getRequestURI() + (query != null ? "?" + query : ""));      
      
         response.sendRedirect("/login");
      }
         
      return false;
   }
}