package com.tis.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tis.domain.GoodsVO;
import com.tis.service.GoodsService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class GoodsMapperTests {
	
	@Autowired
	private GoodsService goodsService;
	
	@Test
	public void goodsList() {
		GoodsVO vo = new GoodsVO();
		vo.setGoodsCategory("health");
		goodsService.getList(vo).forEach(goods -> log.info(goods));
	}

}
