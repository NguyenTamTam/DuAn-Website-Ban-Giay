package com.project.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

import com.project.entity.Product;
import com.project.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	
	@RequestMapping("/product/list")
	public String list(Model model ,@RequestParam("cid")Optional<Integer>cid) {
		if (cid.isPresent()) {
			List<Product> list=productService.findByCategoryId(cid.get());
			
			model.addAttribute("items",list);
 		}else {
			List<Product> list= productService.findAll();
			Collections.sort(list, Comparator.comparing(Product::getPrice));
			model.addAttribute("items",list);
		}
		return "product/list";
	}
	
	@RequestMapping("/product/list/search")
	public String searchlist(Model model, @RequestParam("cid") Optional<Integer> cid , @RequestParam("key") Optional<String> key, @RequestParam("sort") Optional<String> sortValue ,@RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max) {
		List<Product>list = productService.findAll();
	   
	    String sort = sortValue.orElse(""); // Lấy giá trị của sortValue (nếu không tồn tại, thì gán giá trị rỗng)

	    if (sort.equals("giaban_tc")) {
	        // Xử lý khi sắp xếp giá thấp đến cao
	    	double minPrice = min.orElse(Double.MIN_VALUE);
	        double maxPrice = max.orElse(Double.MAX_VALUE);
		    list = productService.findByKeyAndPrice(key.orElse(""), minPrice, maxPrice);
	        Collections.sort(list, Comparator.comparing(Product::getPrice));
	        
	    } else if (sort.equals("giaban_ct")) {
	        // Xử lý khi sắp xếp giá cao đến thấp
	    	double minPrice = min.orElse(Double.MIN_VALUE);
	        double maxPrice = max.orElse(Double.MAX_VALUE);
		    list = productService.findByKeyAndPrice(key.orElse(""), minPrice, maxPrice);
	        Collections.sort(list, Comparator.comparing(Product::getPrice).reversed());
	    } else if (sort.equals("name_az")) {
	        // Xử lý khi sắp xếp tên A - Z
	    	double minPrice = min.orElse(Double.MIN_VALUE);
	        double maxPrice = max.orElse(Double.MAX_VALUE);
		    list = productService.findByKeyAndPrice(key.orElse(""), minPrice, maxPrice);
	        Collections.sort(list, Comparator.comparing(Product::getName));
	    } else if (sort.equals("name_za")) {
	        // Xử lý khi sắp xếp tên Z - A
	    	double minPrice = min.orElse(Double.MIN_VALUE);
	        double maxPrice = max.orElse(Double.MAX_VALUE);
		    list = productService.findByKeyAndPrice(key.orElse(""), minPrice, maxPrice);
	        Collections.sort(list, Comparator.comparing(Product::getName).reversed());
	    }
	    
	    model.addAttribute("items", list);
	    return "product/list";
	}
	
	@RequestMapping("/product/listsale")
	public String listsale(Model model ,@RequestParam("cid")Optional<Integer>cid) {
		if (cid.isPresent()) {
			List<Product> list=productService.findByCategoryId(cid.get());
			model.addAttribute("items",list);
 		}else {
			List<Product> list= productService.findAll();
			model.addAttribute("items",list);
		}
		return "product/list_sale";
	}
	@RequestMapping("/product/list2")
	public String list2(Model model ,@RequestParam("cid")Optional<Integer>cid) {
		if (cid.isPresent()) {
			List<Product> list=productService.findByCategoryId(cid.get());
			model.addAttribute("items",list);
 		}else {
			List<Product> list= productService.findAll();
			model.addAttribute("items",list);
		}
		
		return "product/list2";
	}
	@RequestMapping("/product/list_main")
	public String listMain(Model model ,@RequestParam("cid")Optional<Integer>cid) {
		if (cid.isPresent()) {
			List<Product> list=productService.findByCategoryId(cid.get());
			
			model.addAttribute("items",list);
 		}else {
			List<Product> list= productService.findAll();
			Collections.sort(list, Comparator.comparing(Product::getPrice));
			model.addAttribute("items",list);
		}
		
		return "product/list_main";
	}
	
	@RequestMapping("/product/search")
	public String search(Model model, @RequestParam("key") Optional<String> key) {
		List<Product> list = productService.findByKey(key.orElse(""));
		model.addAttribute("items", list);
		return "product/list2";
	}
	
	@RequestMapping("/product/search/form")
	public String searchform(Model model, @RequestParam("key") Optional<String> key) {
		List<Product> list = productService.findByKey(key.orElse(""));
		model.addAttribute("items", list);
		return "product/list";
	}
	// từ 0 đến 3 triệu
	@RequestMapping("/product/search/price")
	public String searchPrice(Model model, @RequestParam("key") Optional<String> key , @RequestParam("price_range") Optional<String> price_rangeValue , @RequestParam("sort") Optional<String> sortValue) {
		List<Product> list = productService.findAll();
		   
	    String price_range = price_rangeValue.orElse("");
	    String sort = sortValue.orElse("");
	    if (price_range.equals("0-3000000.0")) {
	        double minPrice = 0.0;
	        double maxPrice = 3000000.0;
	        list = productService.findByKeyAndPrice(key.orElse(""), minPrice, maxPrice);
	        Collections.sort(list, Comparator.comparing(Product::getPrice));
	    } else if (price_range.equals("3000000.0-5000000.0")) {
	        double minPrice = 3000000.0;
	        double maxPrice = 5000000.0;
	        list = productService.findByKeyAndPrice(key.orElse(""), minPrice, maxPrice);
	    } else if (price_range.equals("5000000-10000000")) {
	        double minPrice = 5000000.0;
	        double maxPrice = 10000000.0;
	        list = productService.findByKeyAndPrice(key.orElse(""), minPrice, maxPrice);
	    } else if (price_range.equals("10000000-15000000")) {
	        double minPrice = 10000000.0;
	        double maxPrice = 15000000.0;
	        list = productService.findByKeyAndPrice(key.orElse(""), minPrice, maxPrice);
	    } else if (price_range.equals("15000000-0")) {
	        double minPrice = 15000000.0;
	        double maxPrice = Double.MAX_VALUE;
	        list = productService.findByKeyAndPrice(key.orElse(""), minPrice, maxPrice);
	    }
	    
	    if (sort.equals("giaban_tc")) {
	        // Xử lý khi sắp xếp giá thấp đến cao
	        Collections.sort(list, Comparator.comparing(Product::getPrice));
	        
	    } else if (sort.equals("giaban_ct")) {
	        // Xử lý khi sắp xếp giá cao đến thấp
	    	
	        Collections.sort(list, Comparator.comparing(Product::getPrice).reversed());
	    } else if (sort.equals("name_az")) {
	        // Xử lý khi sắp xếp tên A - Z
	    	
	        Collections.sort(list, Comparator.comparing(Product::getName));
	    } else if (sort.equals("name_za")) {
	        // Xử lý khi sắp xếp tên Z - A
	    	
	        Collections.sort(list, Comparator.comparing(Product::getName).reversed());
	    }
		model.addAttribute("items", list);
		return "product/list";
		
	}
	
	// từ 0 đến 3 triệu
		@RequestMapping("/product/search/price2")
		public String searchPrice2(Model model, @RequestParam("key") Optional<String> key, @RequestParam("min") Optional<Double> min,
				@RequestParam("max") Optional<Double> max) {
			double minPrice = min.orElse(Double.MIN_VALUE);
	        double maxPrice = max.orElse(Double.MAX_VALUE);
	        List<Product> list = productService.findByKeyAndPrice(key.orElse(""), minPrice, maxPrice);
			model.addAttribute("items", list);
			return "product/list";
			
		}
		

	
	@RequestMapping("/product/detail/{id}")
	public String detail(Model model, @PathVariable("id")Integer id) {
		Product item = productService.findById(id);
		model.addAttribute("item",item);
//		System.out.println("Sản Phẩm Cùng Loại: "+item.getCategory().getProducts());
		return "product/detail";
	}
	
	@RequestMapping("/product/search-price")
	public String searchProductsByPriceRange(Model model, @RequestParam("minPrice") Optional <Double> minPrice,
            @RequestParam("maxPrice") Optional<Double> maxPrice) {
			List<Product> products = productService.findProductsByPriceRange(0, 3000000.0);
			model.addAttribute("item", products);
			return "product/list";
	}
	
//	@GetMapping("/product/search-price")
//	public String searchProductsByPriceRange(Model model, @RequestParam("minPrice") Optional <Double> minPrice,
//	                                         @RequestParam("maxPrice") Optional<Double> maxPrice) {
////	    List<Product> products = productService.findProductsByPriceRange(minPrice.orElse(""), maxPrice.orElse(""));
////	    model.addAttribute("products", products);
//		List<Product> products;
//	    if (minPrice.isPresent() && maxPrice.isPresent()) {
//	        products = productService.findProductsByPriceRange(minPrice.get(), maxPrice.get());
//	        model.addAttribute("items",products);
//	    } else {
//	    	List<Product> list= productService.findAll();
//			model.addAttribute("items", list);
//	    }
//	    return "product/list";
	
}
