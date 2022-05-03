package service.employee;

import model.employee.Division;
import service.IService;

import java.util.List;

public interface IDivisonService extends IService {
    List<Division> displayDivisionList();
}
