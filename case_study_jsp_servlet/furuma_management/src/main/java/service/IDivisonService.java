package service;

import model.employee.Division;

import java.util.List;

public interface IDivisonService extends IService{
    List<Division> displayDivisionList();
}
