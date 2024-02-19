package com.kh.hope.product.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.hope.product.model.service.ProductService;
import com.kh.hope.product.model.vo.Product;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes({"donateType"})
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/product")
	public String product() {
		return "product/donateProduct";
	}
	
	
	@GetMapping("/product/donateProductForm")
	public String prductForm() {
		
		return "product/donateProductForm";
	}
	
//	proudct 페이지에서 proudctForm으로 이동할 때 donateType(개인, 기업) 전달
    @PostMapping("/product.bo")
    public String handleDonationForm(@RequestParam("donateType") String donateType, Model model) {
        // donateType을 사용하여 원하는 처리를 수행합니다.
        // 이 예제에서는 donateType을 콘솔에 출력하겠습니다.
        System.out.println("선택된 기부 유형: " + donateType);
        model.addAttribute("donateType", donateType);
        
        // 다음에 할 작업에 따라 적절한 뷰 이름을 반환합니다.
        // 여기서는 새로운 페이지로 이동할 것이므로 해당 뷰 이름을 반환합니다.
        return "redirect:/product/donateProductForm";
    }
    
    @PostMapping("/insertProduct.bo")
    public String insertProduct(
    		Product p,
    		@RequestParam String productType,
    		@RequestParam String businessName,
    		@RequestParam String puserName,
    		@RequestParam int phone,
    		@RequestParam String email,
    		@RequestParam String productWay,
    		@RequestParam String productAmount,
    		@RequestParam String receipt,
    		@RequestParam String businessNum,
    		@RequestParam String residentNum,
    		@RequestParam int categoryNo,
    		@RequestParam String inquiryContent,
    		Model model,
			HttpSession session) {
    	
    	
    	
    	log.info("Product : {}", p);
    	
    	p.setProductType(productType);
    	p.setBusinessName(businessName);
    	p.setPuserName(puserName);
    	p.setPhone(phone);
    	p.setEmail(email);
    	p.setProductWay(productWay);
    	p.setProductAmount(productAmount);
    	p.setReceipt(receipt);
    	p.setBusinessNum(businessNum);
    	p.setResidentNum(residentNum);
    	p.setResidentNum(residentNum);
    	p.setCategoryNo(categoryNo);
    	p.setInquiryContent(inquiryContent);
    	
    	int result = productService.insertProduct(p);
    	
    	
    	String url = "";
    	if(result > 0) {
    		session.setAttribute("alertMsg", "물품 기부가 성공적으로 신청되었습니다.");
    		url = "redirect:/product/donateProduct";
    		
    	}else {
    		model.addAttribute("errorMsg", "물품 기부 신청에 실패하였습니다.");
    		url = "redirect:/";
    	}
    	
    	
    	return url;
    }
    

}