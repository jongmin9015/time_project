package com.tis.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tis.domain.CategoryVO;
import com.tis.domain.Criteria;
import com.tis.domain.GoodsVO;
import com.tis.service.GoodsService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class GoodsMapperTests {
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private GoodsMapper mapper;
	
//	@Test
//	public void goodsList() {
//		GoodsVO vo = new GoodsVO();
//		vo.setGoodsCategory("diet");
//		goodsService.getGoodsSubList(vo).forEach(goods -> log.info(goods));
//	}
//	
//	@Test
//	public void test() {
//		Criteria cri = new Criteria();
//		GoodsVO vo = new GoodsVO(cri);
//		vo.setPriceSort("desc");
//		vo.setGoodsCategory("health");
//		mapper.getGoodsListWithPaging(vo);
//	}
	@Test
	public void getNo() {
		Criteria cri = new Criteria();
		GoodsVO goods = new GoodsVO(cri);
		
		goods.setKeyword("면");
		mapper.getSearchList(goods);
		
	}
	

	

}
