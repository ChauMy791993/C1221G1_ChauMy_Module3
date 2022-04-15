package service;

import model.Product;
import repository.IProductRepository;
import repository.ProductRepositoryImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements IProductService{
    IProductRepository iProductRepository = new ProductRepositoryImpl();
    @Override
    public List<Product> getListProduct() {
        List<Product> productList = iProductRepository.getList();
        return productList;
    }

    @Override
    public Map<String, String> save(Product product) {
        Map<String,String> map =new HashMap<>();
        if (product.getName().equals("")){
            map.put("name","Tên không được để trống");
        }else if(!product.getName().matches("^[a-zA-Z ]+$")){
            map.put("name","Tên không hợp lệ");
        }

        if(map.isEmpty()) {
            iProductRepository.save(product);
        }
        return map;
    }
}
