package service.employee.impl;

import model.employee.EducationDegree;
import repository.IEducationDegreeRepository;
import repository.impl.EducationDegreeRepositoryImpl;
import service.employee.IEducationDegreeService;

import java.util.List;

public class EducationDegreeServiceImpl implements IEducationDegreeService {

    IEducationDegreeRepository iEducationDegreeRepository = new EducationDegreeRepositoryImpl();
    @Override
    public List<EducationDegree> displayEducationDegreeList() {
        return iEducationDegreeRepository.displayEducationDegreeList();
    }
}
