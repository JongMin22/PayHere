package AccountBookTests;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.payhere.accountbook.domain.AccountBookVO;
import com.payhere.accountbook.mapper.AccountBookMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AccountBookListTests {
	
	@Autowired
	private AccountBookMapper mapper;
	
		// ■ 가계부 리스트 뽑아오기 -  ●성공● 
		// @Test
		public void AccountBookList() {
			List<AccountBookVO> accountList  = mapper.selectTitle("user1");
			log.info("가계부 리스트  : " + accountList);
		}
		
		// ■ 가계부 추가하기 - ●성공● 
		// @Test
		public void insertAccount() {
			AccountBookVO vo = new AccountBookVO();
			vo.setUserId("user1");
			vo.setMoney(10000);
			vo.setAccountContent("Boradole-E");
			vo.setAccountTitle("Ddu-B");
			mapper.insertAccount(vo);
			
			AccountBookList();
		}
		
		// ■ 가계부 삭제하기(delete True(1) => False(0)) -  ●성공●  
		// @Test
		public void deleteAccount() {
			
			AccountBookVO vo = new AccountBookVO();
			vo.setAccountBookNum(6);
			log.info(vo);
			mapper.deleteAccount(vo.getAccountBookNum());
			
			AccountBookList();
			
		}
		
		// ■ 삭제한 가계부 리스트 뽑아오기 -   ●성공● 
		// @Test 
		public void DeletedAccountBookList() {
			List<AccountBookVO> accountList  = mapper.selectDeletedTitle("user1");
			log.info("가계부 리스트  : " + accountList);
		}
		
		// ■ 삭제한 가계부 복원하기  - ●성공● 
		// @Test 
		public void restoreAccount() {
		
			AccountBookVO vo = new AccountBookVO();
			vo.setAccountBookNum(6);
			log.info(vo);
			mapper.restoreAccount(vo.getAccountBookNum());
			
			AccountBookList();
		}
		
		// ■ 가계부 수정하기 - ●성공● 
		// @Test
		public void updateAccount() {
			AccountBookVO vo = new AccountBookVO();
			vo.setUserId("user1");
			vo.setMoney(20000);
			vo.setAccountContent("Boradole-E");
			vo.setAccountTitle("Ddu-B");
			vo.setAccountBookNum(6);
			mapper.updateAccount(vo);
			
			AccountBookList();
			
		}

}
