package com.tis.mapper;

import java.util.List;

import com.tis.domain.CategoryVO;

public interface CategoryMapper {

	// 상품 카테고리 조회	
	List<CategoryVO> getCategory(CategoryVO category);
}
