package repository;

import model.employee.Division;
import model.employee.EducationDegree;

import java.util.List;

public interface IEducationDegreeRepository {
    List<EducationDegree> displayEducationDegreeList();
}
