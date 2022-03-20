package com.tis.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tis.domain.AddressVO;
import com.tis.service.AddressService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AddressMapperTests {

	@Autowired
	private  AddressService addressService;
	
	@Test
	public void insert() {
		
		AddressVO address = new AddressVO();
	
		
		addressService.insertAddress(address);
	}
}
