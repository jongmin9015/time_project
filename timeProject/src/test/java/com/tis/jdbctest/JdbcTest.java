package com.tis.jdbctest;

import static org.junit.Assert.assertNotNull;

import java.sql.Connection;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class JdbcTest {
	
	@Autowired
	private SqlSessionFactory sqlsession;
	
	@Test
	public void jdbctest() {
		Connection conn = null;
		
		try {
			conn = sqlsession.openSession().getConnection();
			System.out.println("연결성공");
			assertNotNull(conn);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("실패");
		} 
	}

}
