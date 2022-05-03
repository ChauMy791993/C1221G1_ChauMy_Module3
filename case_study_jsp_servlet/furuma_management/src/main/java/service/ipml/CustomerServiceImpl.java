package service.ipml;

import model.customer.Customer;
import model.customer.CustomerType;
import repository.ICustomerRepository;
import repository.impl.CustomerRepositoryImpl;
import service.ICustomerService;

import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    private ICustomerRepository iCustomerRepository = new CustomerRepositoryImpl();

    @Override
    public List<Customer> showListCustomer() {
        List<Customer> customerList = iCustomerRepository.showListCustomer();
        return customerList;
    }

    @Override
    public List<CustomerType> showListCustomerType() {
        List<CustomerType> customerTypeList = iCustomerRepository.showListCustomerType();
        return customerTypeList;
    }

    @Override
    public void createCustomer(Customer customer) {
        iCustomerRepository.createCustomer(customer);
    }

    @Override
    public Customer findCustomerById(int id) {
        Customer customer = iCustomerRepository.findCustomerById(id);
        return customer;
    }

    @Override
    public void editCustomer(Customer customer) {
        iCustomerRepository.editCustomer(customer);
    }

    @Override
    public List<Customer> search(String name, String address, String type) {
        return iCustomerRepository.search(name, address, type);
    }

    @Override
    public void delete(Integer id) {
        iCustomerRepository.delete(id);
    }
}
