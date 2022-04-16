package service;

import model.Product;

import java.util.List;
import java.util.Map;

public interface IProductService {
    List<Product> getListProduct();
    void create (Product product);
    void updateProduct (int id,Product product);
    void deleteProduct (Product product);
    Product findById (int id);
    List<Product> findByName (String name);

}
