package kr.ac.kopo.relief.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.kopo.relief.model.Member;

public class UserInterceptor extends HandlerInterceptorAdapter {

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      HttpSession session = request.getSession();
      
      Member member = (Member) session.getAttribute("member");
      if(member != null) {
         System.out.println("UserInterceptor: TRUE");
         System.out.println(member.getGrade());
         return true;
      }
      
      String query = request.getQueryString();      
      session.setAttribute("target", request.getRequestURI() + (query != null ? "?" + query : ""));
      
      System.out.println("UserInterceptor: FALSE");
      response.sendRedirect("/login");
      return false;
   }

   
}