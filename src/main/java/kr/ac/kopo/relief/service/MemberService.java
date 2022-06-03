package kr.ac.kopo.relief.service;

import kr.ac.kopo.relief.model.Member;

public interface MemberService {

   boolean login(Member member);

   void add(Member member);

   boolean checkId(String id);

   Member item(String id);

}