package service;

import model.customer.Customer;
import model.customer.CustomerType;

import java.util.List;

public interface ICustomerService extends IService {
    List<Customer> showListCustomer ();
    List<CustomerType> showListCustomerType ();
    void createCustomer (Customer customer);
    Customer findCustomerById (int id);
    void editCustomer (Customer customer);
    List<Customer> search(String name, String address, String type);
    void delete(Integer id);
}

