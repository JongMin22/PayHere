package ConnectionTests;



import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MySQLConntectionPoolTest {
	
	@Autowired
	private DataSource dataSource;
	
	@Test
	public void testConntection() {
		
		try(Connection con = dataSource.getConnection()){
			log.info(con);
			log.info("hikariCP connected");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	

}
