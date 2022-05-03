package service.customer;

import model.customer.Customer;
import model.customer.CustomerType;
import service.IService;

import java.util.List;
import java.util.Map;

public interface ICustomerService extends IService {
    List<Customer> showListCustomer ();
    List<CustomerType> showListCustomerType ();
    Map<String, String> createCustomer (Customer customer);
    Customer findCustomerById (int id);
    Map<String, String> editCustomer (Customer customer);
    List<Customer> search(String name, String address, String type);
    void delete(Integer id);
}

