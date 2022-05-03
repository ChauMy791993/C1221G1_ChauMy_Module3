package service.customer;

import model.customer.Customer;
import model.customer.CustomerType;
import repository.ICustomerRepository;
import repository.impl.CustomerRepositoryImpl;
import service.customer.ICustomerService;
import utils.RegularExpression;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Map<String, String> createCustomer(Customer customer) {
        Map<String, String> customerError = new HashMap<>();
        if ("".equals(customer.getName())) {
            customerError.put("name", "name is not be empty !");
        }
        if ("".equals(customer.getIdCard())) {
            customerError.put("idCard", "id card is not be empty");
        } else if (!RegularExpression.checkIdCard(customer.getIdCard())) {
            customerError.put("idCard", "id card is must be 9 numbers or 12 numbers");
        }
        if ("".equals(customer.getPhone())) {
            customerError.put("phone", "phone is not be empty");
        } else if (!RegularExpression.checkPhone(customer.getPhone())) {
            customerError.put("phone", "phone number base on 090xxxxxxx or 091xxxxxxx or (84)+90xxxxxxx or (84)+91xxxxxxx");
        }
        if ("".equals(customer.getEmail())) {
            customerError.put("email", "email is not be empty");
        } else if (!RegularExpression.checkEmail(customer.getEmail())) {
            customerError.put("email", "email base on ...@...dot... ");
        }
        if (customerError.isEmpty()) {
            iCustomerRepository.createCustomer(customer);
        }
        return customerError;
    }

    @Override
    public Customer findCustomerById(int id) {
        return iCustomerRepository.findCustomerById(id);
    }

    @Override
    public Map<String, String> editCustomer(Customer customer) {

        Map<String, String> customerError = new HashMap<>();

        if ("".equals(customer.getName())) {
            customerError.put("name", "name is not be empty !");
        }
        if ("".equals(customer.getIdCard())) {
            customerError.put("idCard", "id card is not be empty");
        } else if (!RegularExpression.checkIdCard(customer.getIdCard())) {
            customerError.put("idCard", "id card is must be 9 numbers or 12 numbers");
        }
        if ("".equals(customer.getPhone())) {
            customerError.put("phone", "phone is not be empty");
        } else if (!RegularExpression.checkPhone(customer.getPhone())) {
            customerError.put("phone", "phone number base on 090xxxxxxx or 091xxxxxxx or (84)+90xxxxxxx or (84)+91xxxxxxx");
        }
        if ("".equals(customer.getEmail())) {
            customerError.put("email", "email is not be empty");
        } else if (!RegularExpression.checkEmail(customer.getEmail())) {
            customerError.put("email", "email base on ...@...dot... ");
        }
        if (customerError.isEmpty()) {
            iCustomerRepository.editCustomer(customer);
        }
        return customerError;
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
