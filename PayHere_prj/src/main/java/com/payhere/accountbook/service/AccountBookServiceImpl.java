package com.payhere.accountbook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.payhere.accountbook.domain.AccountBookVO;
import com.payhere.accountbook.mapper.AccountBookMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AccountBookServiceImpl implements AccountBookService{

	@Autowired
	private AccountBookMapper mapper;
	
	@Override
	public List<AccountBookVO> selectTitle(String userId) {
		
		return mapper.selectTitle(userId);
	}
	
	@Override
	public List<AccountBookVO> selectDeletedTitle(String userId) {
		
		return mapper.selectDeletedTitle(userId);
	}


	@Override
	public void insertAccount(AccountBookVO vo) {
		mapper.insertAccount(vo);
		
	}

	@Override
	public void deleteAccount(int accountBookNum) {
		mapper.deleteAccount(accountBookNum);
		
	}
	@Override
	public void restoreAccount(int accountBookNum) {
		mapper.restoreAccount(accountBookNum);
		
	}

	@Override
	public void updateAccount(AccountBookVO vo) {
		mapper.updateAccount(vo);
		
	}
	@Override
	public int totalAccount(String userId) {
		return mapper.totalAccount(userId);
		
	}
	
	@Override
	public List<AccountBookVO> selectDetails(int accountBookNum) {
		
		return mapper.selectDetails(accountBookNum);
	}

}
