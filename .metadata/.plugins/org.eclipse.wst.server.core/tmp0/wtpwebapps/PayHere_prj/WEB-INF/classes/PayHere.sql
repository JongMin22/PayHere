use payhere_prj;

-- ■ 회원 테이블
CREATE TABLE user_tbl(
user_num int(5) AUTO_INCREMENT primary key,
user_id varchar(50) unique,
user_pw varchar(100) not null,
user_name varchar(100) not null,
user_pnum varchar(50) not null,
user_email varchar(100) not null,
user_rdate datetime DEFAULT CURRENT_TIMESTAMP,
user_enabled boolean
);

select * from user_tbl;
INSERT INTO user_tbl (user_id,user_pw,user_name,user_pnum,user_email) values ('user1','pw1','뚜비','010-0000-0000','user1@naver.com');


-- ■ 회원등급 테이블
CREATE TABLE auth_tbl(
auth_num int(5) AUTO_INCREMENT primary key,
user_id varchar(50) not null,
auth varchar(50) not null,
constraint fk_auth foreign key(user_id) references user_tbl(user_id)
);

select * from auth_tbl;

-- ■ 자동로그인 관리테이블
CREATE TABLE persistent_logins(
	username varchar(64) not null,
    series varchar(64) primary key,
    token varchar(64) not null,
    last_used timestamp not null
);

-- ■ 가계부 테이블
CREATE TABLE account_book_list(
	account_book_num int(5) AUTO_INCREMENT primary key,
	user_id varchar(50) not null,
    account_title varchar(50) not null,
    account_content varchar(50) not null,
    money int(10),
    account_rdate datetime DEFAULT CURRENT_TIMESTAMP,
    account_mdate datetime,
    deleted boolean default True,
constraint fk_book_id foreign key(user_id) references user_tbl(user_id)    
);


INSERT INTO account_book_list(user_id,account_title,account_content,money) values ('user1','abc1','abc1',50000);

-- ■ 쿼리문 확인
-- SELECT * FROM account_book_list WHERE user_id = 'user1';

SELECT sum(money) FROM account_book_list WHERE user_id = 'user1' and deleted = 1;


UPDATE account_book_list SET deleted = 0 WHERE account_book_num=1;
UPDATE account_book_list SET account_mdate = now() WHERE user_id = 'user1';

drop table account_book_list;




