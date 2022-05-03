package repository.impl;

import model.employee.Division;
import repository.BaseRepository;
import repository.IDivisonRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepositoryImpl implements IDivisonRepository {

    private BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Division> displayDivisionList() {
        List<Division> divisionList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement("select * from bo_phan ");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer divisionId = resultSet.getInt("ma_bo_phan");
                String divisionName = resultSet.getString("ten_bo_phan");
                divisionList.add(new Division(divisionId, divisionName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return divisionList;
    }
}
