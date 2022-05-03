package service.employee.impl;

import model.employee.Position;
import repository.IPositionRepository;
import repository.impl.PositionRepositoryImpl;
import service.employee.IPositionService;

import java.util.List;

public class PositionServiceImpl implements IPositionService {

    IPositionRepository iPositionRepository = new PositionRepositoryImpl();
    @Override
    public List<Position> displayPositionList() {
        return iPositionRepository.displayPositionList();
    }
}
