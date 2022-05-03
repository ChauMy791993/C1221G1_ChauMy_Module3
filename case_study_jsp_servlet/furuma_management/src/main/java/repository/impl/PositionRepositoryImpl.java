package repository.impl;

import model.employee.EducationDegree;
import model.employee.Position;
import repository.BaseRepository;
import repository.IPositionRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepositoryImpl implements IPositionRepository {
    private BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Position> displayPositionList() {
        List<Position> positionList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement("select * from vi_tri ");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer positionId = resultSet.getInt("ma_vi_tri");
                String positionName = resultSet.getString("ten_vi_tri");
                positionList.add(new Position(positionId, positionName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return positionList;

    }
}
