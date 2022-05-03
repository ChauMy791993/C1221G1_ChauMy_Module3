package repository;

import model.customer.Customer;
import model.employee.Employee;
import repository.ICrudRepository;

import java.util.List;

public interface IEmployeeRepository extends ICrudRepository {
    List<Employee> displayEmployeeList();

    void insertEmployee(Employee employee);

    void deleteEmployee(Integer id);

    void editEmployee (Employee employee);

    List<Employee> findEmployee(String id, String name,String phone);

    Employee findEmployeeById(int id);
}
