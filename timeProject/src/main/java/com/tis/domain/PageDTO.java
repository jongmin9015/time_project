package com.tis.domain;

import lombok.Data;

@Data
public class PageDTO {
	
	private int startPage;
	private int endPage;
	private boolean next, prev;
	
	private int total;
	private Criteria cri;
	
	int realEnd;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 9.0)) * cri.getAmount();
		this.startPage = (endPage - cri.getAmount()) + 1;
		
		realEnd = (int) Math.ceil((total * 1.0) / cri.getAmount());
		
		if (endPage > realEnd) {
			endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next =  realEnd > this.endPage; 
	}
}
