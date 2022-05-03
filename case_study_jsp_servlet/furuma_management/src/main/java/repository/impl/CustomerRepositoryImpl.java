package repository.impl;

import model.customer.Customer;
import model.customer.CustomerType;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository {
    private BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Customer> showListCustomer() {
        List<Customer> customerList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement
                    ("select ma_khach_hang,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach from khach_hang;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer idCustomer = resultSet.getInt("ma_khach_hang");
                String name = resultSet.getString("ho_ten");
                String dateOfBirth = resultSet.getString("ngay_sinh");
                Integer gender = resultSet.getInt("gioi_tinh");
                String idCard = resultSet.getString("so_cmnd");
                String phone = resultSet.getString("so_dien_thoai");
                String email = resultSet.getString("email");
                String address = resultSet.getString("dia_chi");
                Integer type = resultSet.getInt("ma_loai_khach");
                customerList.add(new Customer(idCustomer, name, dateOfBirth, gender, idCard, phone, email, address, type));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public List<CustomerType> showListCustomerType() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement("select ma_loai_khach,ten_loai_khach from loai_khach;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer idCustomerType = resultSet.getInt("ma_loai_khach");
                String nameCustomerType = resultSet.getString("ten_loai_khach");
                customerTypeList.add(new CustomerType(idCustomerType, nameCustomerType));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeList;
    }

    @Override
    public void createCustomer(Customer customer) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement
                    ("insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) value (?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getDateOfBirth());
            preparedStatement.setInt(3, customer.getGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getType());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Customer findCustomerById(int id) {
        Customer customer = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement("SELECT ma_khach_hang,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach FROM khach_hang WHERE ma_khach_hang =?;");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("ho_ten");
                String dateOfBirth = resultSet.getString("ngay_sinh");
                Integer gender = resultSet.getInt("gioi_tinh");
                String idCard = resultSet.getString("so_cmnd");
                String phone = resultSet.getString("so_dien_thoai");
                String email = resultSet.getString("email");
                String address = resultSet.getString("dia_chi");
                Integer type = resultSet.getInt("ma_loai_khach");
                customer = new Customer(name, dateOfBirth, gender, idCard, phone, email, address, type);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }


    @Override
    public void editCustomer(Customer customer) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement("UPDATE khach_hang SET ho_ten = ?,ngay_sinh = ?,gioi_tinh = ?,so_cmnd = ?,so_dien_thoai = ?,email = ?,dia_chi = ?,ma_loai_khach = ? WHERE ma_khach_hang = ?;");
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getDateOfBirth());
            preparedStatement.setInt(3, customer.getGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getType());
            preparedStatement.setInt(9, customer.getIdCustomer());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Customer> search(String name, String address, String type) {
        List<Customer> customerList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement
                    ("SELECT * FROM khach_hang where ho_ten like ? and dia_chi like ? and ma_loai_khach like ?;");
            preparedStatement.setString(1, "%" + name + "%");
            preparedStatement.setString(2, "%" + address + "%");
            preparedStatement.setString(3, "%" + type + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer idCustomer = resultSet.getInt("ma_khach_hang");
                String nameCustomer = resultSet.getString("ho_ten");
                String dateOfBirth = resultSet.getString("ngay_sinh");
                Integer gender = resultSet.getInt("gioi_tinh");
                String idCard = resultSet.getString("so_cmnd");
                String phone = resultSet.getString("so_dien_thoai");
                String email = resultSet.getString("email");
                String addressCustomer = resultSet.getString("dia_chi");
                Integer typeCustomer = resultSet.getInt("ma_loai_khach");
                customerList.add(new Customer(idCustomer, nameCustomer, dateOfBirth, gender, idCard, phone, email, addressCustomer, typeCustomer));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void delete(Integer id) {
        CallableStatement callableStatement = null;
        try {
            callableStatement = this.baseRepository.getConnection().prepareCall("{call sp_xoa_khach_hang(?)}");
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
