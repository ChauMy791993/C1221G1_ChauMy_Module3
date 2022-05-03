package service.ipml;

import model.employee.Division;
import repository.IDivisonRepository;
import repository.impl.DivisionRepositoryImpl;
import service.IDivisonService;

import java.util.List;

public class DvisionServiceImpl implements IDivisonService {

IDivisonRepository iDivisonRepository = new DivisionRepositoryImpl();

    @Override
    public List<Division> displayDivisionList() {
        return iDivisonRepository.displayDivisionList();
    }
}
