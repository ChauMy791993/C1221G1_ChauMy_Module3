package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "iphone", 500000.0, "Apple"));
        productList.add(new Product(2, "giày", 100000.0, "Nike"));
        productList.add(new Product(3, "quần", 150000.0, "Adidas"));
    }

    @Override
    public List<Product> getList() {
        return productList;
    }

    @Override
    public void save(Product product) {
        productList.add(product);

    }

    @Override
    public void update(int id, Product product) {

    }

    @Override
    public void remove(int id) {

    }

    @Override
    public Product findByName(String name) {
        return null;
    }
}
