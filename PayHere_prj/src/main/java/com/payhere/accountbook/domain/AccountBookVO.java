package com.payhere.accountbook.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class AccountBookVO {

	private int accountBookNum; 	// ■ 가계부 번호
	private String 	userId; 		// ■ 유저 아이디
	private String accountTitle;	// ■ 가계부 제목
	private String accountContent;	// ■ 가계부 내용
	private int  money ;			// ■ 지출 금액
	private Date accountRdate;  	// ■ 작성일
	private Date accountMdate;  	// ■ 수정일
	private int totalMoney;			// ■ 총 지출액
	private boolean deleted;		// ■ 삭제여부
	

}
