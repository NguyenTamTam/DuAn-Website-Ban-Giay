package com.project.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import com.project.dao.OrderDetailDAO;
import com.project.dao.ProductDAO;
import com.project.entity.Product;
import com.project.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class ProductServiceImql implements ProductService {
	@Autowired
	ProductDAO pdao;

	@Override
	public List<Product> findAll() {
		
		return pdao.findAll();
	}

	@Override
	public Product findById(Integer id) {
		
		return pdao.findById(id).get();
	}


	@Override
	public List<Product> findByKey(String key) {
		// TODO Auto-generated method stub
		return pdao.findByKey(key);
	}
	
	@Override
	public List<Product> findByKeyAndPrice(String key, double minPrice, double maxPrice) {
        return pdao.findByKeyAndPrice(key, minPrice, maxPrice);
    }
	
	@Override
	public List<Product> findByCategoryId(Integer cid) {
		// TODO Auto-generated method stub
		return pdao.findByCategoryId(cid);
	}

	@Override
	public Product create(Product product) {
		// TODO Auto-generated method stub
		return pdao.save(product);
	}

	@Override
	public Product update(Product product) {
		// TODO Auto-generated method stub
		return pdao.save(product);
	}

	@Autowired
    private OrderDetailDAO orderDetailRepository; 
 @Autowired
    private ProductDAO productRepository;	
    @Override
    @Transactional
    public void delete(Integer id) {
        Product product = productRepository.findById(id).orElse(null);
        if (product != null) {

            orderDetailRepository.deleteByProduct(product);


            productRepository.deleteById(id);
        }
    }

	@Override
	public List<Product> findProductsByPriceRange(double minPrice, double maxPrice) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// tìm kiếm theo giá
//		@Override
//	 public List<Product> findProductsByPriceRange(double minPrice, double maxPrice) {
//	        return pdao.findByPriceBetween(minPrice, maxPrice);
//	    }
//
//		@Override
//		public List<Product> findByPrice(double minPrice, double maxPrice) {
//			// TODO Auto-generated method stub
//			return pdao.findByPrice(minPrice, maxPrice);
//		}
//
//		@Override
//		public List<Product> findByPriceBetween(double minPrice, double maxPrice) {
//			// TODO Auto-generated method stub
//			return pdao.findByPriceBetween(minPrice, maxPrice);
//		}
	
}	
