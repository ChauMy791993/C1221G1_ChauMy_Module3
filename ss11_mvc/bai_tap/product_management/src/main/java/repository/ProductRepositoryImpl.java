package repository;

import model.Product;

import java.util.*;

public class ProductRepositoryImpl implements IProductRepository {
    private static Map<Integer, Product> productList = new HashMap<>();

    static {
        productList.put(1, new Product(1, "iphone", 500000.0, "Apple"));
        productList.put(2, new Product(2, "giày", 100000.0, "Nike"));
        productList.put(3, new Product(3, "quần", 150000.0, "Adidas"));
    }


    @Override
    public List<Product> list() {
        return new ArrayList<>(productList.values());
    }

    @Override
    public void create(Product product) {
        productList.put(product.getId(), product);
    }

    @Override
    public void update(int id, Product product) {
        productList.replace(id, product);
    }

    @Override
    public void delete(Product product) {
        productList.remove(product.getId(), product);
    }


    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productFindtList = new ArrayList<>();
        for (Product product : list()) {
            if (product.getName().toLowerCase().contains(name.toLowerCase())) {
                productFindtList.add(product);
            }
        }
        return productFindtList;
    }

}
