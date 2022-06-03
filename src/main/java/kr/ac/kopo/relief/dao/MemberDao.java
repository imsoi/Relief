package kr.ac.kopo.relief.dao;

import kr.ac.kopo.relief.model.Member;

public interface MemberDao {

   Member item(Member member);

   void add(Member member);

   int checkId(String id);

   Member item(String id);

}