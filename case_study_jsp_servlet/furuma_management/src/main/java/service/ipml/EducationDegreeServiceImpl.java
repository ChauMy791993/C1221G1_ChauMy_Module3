package service.ipml;

import model.employee.EducationDegree;
import repository.IEducationDegreeRepository;
import repository.IEmployeeRepository;
import repository.impl.EducationDegreeRepositoryImpl;
import service.IEducationDegreeService;

import java.util.List;

public class EducationDegreeServiceImpl implements IEducationDegreeService {

    IEducationDegreeRepository iEducationDegreeRepository = new EducationDegreeRepositoryImpl();
    @Override
    public List<EducationDegree> displayEducationDegreeList() {
        return iEducationDegreeRepository.displayEducationDegreeList();
    }
}
