package com.tis.page;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tis.domain.Criteria;
import com.tis.domain.GoodsVO;
import com.tis.domain.PageDTO;
import com.tis.mapper.GoodsMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PageTests {

	@Autowired
	
	private GoodsMapper mapper;
	@Test
	
	public void criteria() {
		Criteria cri = new Criteria(1,9);
		PageDTO dto = new PageDTO(cri, 200);
		GoodsVO goods = new GoodsVO(cri);
//		goods.setGoodsCategory("salad");
		goods.setCategorySubTitle("pizza");
		
		
		mapper.getGoodsSubListWithPaging(goods);
		
	}
}
