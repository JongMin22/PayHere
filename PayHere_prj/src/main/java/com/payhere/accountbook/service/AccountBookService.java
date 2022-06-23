package com.payhere.accountbook.service;

import java.util.List;

import com.payhere.accountbook.domain.AccountBookVO;

public interface AccountBookService {

		// ■ 해당 유저의 가계부 리스트 불러오기.
		public List<AccountBookVO> selectTitle(String userId);
		
		// ■ 해당 유저의 삭제한 가계부 리스트 불러오기.
		public List<AccountBookVO> selectDeletedTitle(String userId);
		
		// ■ 가계부 작성하기
		public void insertAccount(AccountBookVO vo);
		
		// ■ 가계부 삭제하기
		public void deleteAccount(int accountBookNum); 		
		
		// ■ 가계부 복원하기
		public void restoreAccount(int accountBookNum);
		
		// ■ 가계부 수정하기
		public void updateAccount(AccountBookVO vo); 		
		
		// ■ 가계부 총 지출 계산하기 
		public int totalAccount(String userId);
		
		// ■ 해당 유저의 가계부 리스트 불러오기.
		public List<AccountBookVO> selectDetails(int accountBookNum);
}
