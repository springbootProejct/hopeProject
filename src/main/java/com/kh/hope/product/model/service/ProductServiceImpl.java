package com.kh.hope.product.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.product.model.dao.ProductDao;
import com.kh.hope.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDao productDao;

//	물품 기부 신청
	@Override
	public int insertProduct(Product p) {
		return productDao.insertProduct(p);
	}

}
