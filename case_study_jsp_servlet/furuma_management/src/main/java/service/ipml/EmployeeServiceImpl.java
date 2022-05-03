package service.ipml;

import model.employee.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepositoryImpl;
import service.IEmployeeService;

import java.util.List;

public class EmployeeServiceImpl implements IEmployeeService {

    IEmployeeRepository iEmployeeRepository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> displayEmployeeList() {
        return iEmployeeRepository.displayEmployeeList();
    }

    @Override
    public void insertEmployee(Employee employee) {
        iEmployeeRepository.insertEmployee(employee);
    }

    @Override
    public void deleteEmployee(Integer id) {
        iEmployeeRepository.deleteEmployee(id);
    }

    @Override
    public void editEmployee(Employee employee) {
        iEmployeeRepository.editEmployee(employee);
    }

    @Override
    public List<Employee> findEmployee(String id, String name, String phone) {
        return iEmployeeRepository.findEmployee(id, name, phone);
    }

    @Override
    public Employee findEmployeeById(int id) {
        return iEmployeeRepository.findEmployeeById(id);
    }
}
