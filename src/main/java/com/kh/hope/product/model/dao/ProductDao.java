package com.kh.hope.product.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.product.model.vo.Product;
import com.kh.hope.product.model.vo.ProductCategory;

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

//  물품기부 번호
	public int selectProductNo() {
		return session.selectOne("productMapper.selectProductNo");
	}


//	물품 기부 리스트 조회
	public List<Product> selectProductNoCheck(String phone) {
		return session.selectList("productMapper.selectProductNoCheck" , phone );
	}

//	물품 기부 수정 체크
	public Product selectProductUpdateCheck(Product pro) {
		return session.selectOne("productMapper.selectProductUpdateCheck", pro);
	}

//	물품 기부 수정
	public int updateProduct(Product pro) {
		return session.update("productMapper.updateProduct", pro);
	}

//	물품 기부 카테고리 리스트
	public List<ProductCategory> selectProductCategoryList() {
		return session.selectList("productMapper.selectProductCategoryList");
	}
	

}
