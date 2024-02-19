package com.kh.hope.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ProductDao {
	
	@Autowired
	private SqlSessionTemplate session;
	

//  물품기부 신청
	public int insertProduct(Product p) {
		return session.insert("productMapper.insertProduct", p);
	}
	

}
