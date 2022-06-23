package com.payhere.accountbook.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.payhere.accountbook.domain.AccountBookVO;
import com.payhere.accountbook.service.AccountBookService;
import com.payhere.security.service.SecurityService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/payhere")
public class AccountBookRestController {

	
	@Autowired
	private AccountBookService accountService;
	
	
	// ■ 가계부 리스트 불러오기 (Select)
	@GetMapping(value="/account", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<List<AccountBookVO>> accountList(Principal principal){
		
		String userId = principal.getName();
		
		log.info("로그인 아이디 : " + userId);
		
		ResponseEntity<List<AccountBookVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(accountService.selectTitle(userId), HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
	}
		
		return entity;

	}
	
	// ■ 가계부 총 지출 가져오기 (Select sum())
	@GetMapping(value="/total", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<Integer> accountTotal(Principal principal){
		
		String userId = principal.getName();
		
		log.info("로그인 아이디 : " + userId);
		
		ResponseEntity<Integer> entity = null;
		
		System.out.println("총 지출액 : " + accountService.totalAccount(userId));
		
		try {
			entity = new ResponseEntity<>(accountService.totalAccount(userId), HttpStatus.OK);
			System.out.println("entity 값 : " + entity);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
		}
		
		return entity;
		
	}
	
	// ■ 삭제된 가계부 리스트 불러오기
	@GetMapping(value="/deleted", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<List<AccountBookVO>> deletedList(Principal principal){
		
		String userId = principal.getName();
		
		log.info("로그인 아이디 : " + userId);
		
		ResponseEntity<List<AccountBookVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(accountService.selectDeletedTitle(userId), HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
	}
		
		return entity;

	}
	
	// ■ 특정 가계부 디테일 불러오기 
		@GetMapping(value="/details/{accountBookNum}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE} )
		public ResponseEntity<List<AccountBookVO>> accountList(@PathVariable("accountBookNum") int accountBookNum){
			
			
			ResponseEntity<List<AccountBookVO>> entity = null;
			
			try {
				entity = new ResponseEntity<>(accountService.selectDetails(accountBookNum), HttpStatus.OK);
				
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
		}
			
			return entity;

		}
	
	// ■ 가계부 삭제 
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/delete",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> delete(
			@RequestBody AccountBookVO vo){
		
		System.out.println("받아온 가계부번호 : " + vo.getAccountBookNum());
		
		ResponseEntity<String> entity = null;
		try {	
			
			
			accountService.deleteAccount(vo.getAccountBookNum());
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	// ■ 가계부 복원 
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/restore",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> restore(
		@RequestBody AccountBookVO vo){
		
		
		
		ResponseEntity<String> entity = null;
		try {	
	
	
	accountService.restoreAccount(vo.getAccountBookNum());
	
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
}
	
	// ■ 가계부 등록
	@PostMapping(value="/insert", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})

	public ResponseEntity<String> register(
			@RequestBody AccountBookVO vo){

		System.out.println("들어온 vo : " + vo);
		ResponseEntity<String> entity = null;
		try {

			accountService.insertAccount(vo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		} catch(Exception e) {

			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	// ■ 가계부 수정 
		@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
				value="/update",
				consumes="application/json",
				produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> update(
			@RequestBody AccountBookVO vo){
			
			
			
			ResponseEntity<String> entity = null;
			try {	
		
		
		accountService.updateAccount(vo);
		
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
	}
	

}
