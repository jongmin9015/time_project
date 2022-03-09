package com.tis.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.tis.domain.CategoryVO;
import com.tis.mapper.CategoryMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CategoryServiceImpl implements CategoryService {

	private final CategoryMapper categoryMapper;
	
	// 상품 카테고리 조회
	@Override
	public List<CategoryVO> getCategory(CategoryVO category) {
		return categoryMapper.getCategory(category);
	}

}
