package repository.impl;

import model.employee.Division;
import model.employee.EducationDegree;
import repository.BaseRepository;
import repository.IEducationDegreeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepositoryImpl implements IEducationDegreeRepository {
    private BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<EducationDegree> displayEducationDegreeList() {
        List<EducationDegree> educationDegreeList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement("select * from trinh_do ");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer educationDegreeId = resultSet.getInt("ma_trinh_do");
                String educationDegreeName = resultSet.getString("ten_trinh_do");
                educationDegreeList.add(new EducationDegree(educationDegreeId, educationDegreeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return educationDegreeList;
    }
}

