package org.btm.service;

import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import org.btm.dao.EmployeeDao;
import org.btm.dto.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {
	@Autowired
	EmployeeDao employeeDao;

	public Employee saveEmployee(Employee employee) {
		LocalDate dob = LocalDate.parse(employee.getDob());
		employee.setAge(Period.between(dob, LocalDate.now()).getYears());
		return employeeDao.saveEmployee(employee);
	}

	public Employee updateEmployee(Employee employee) {
		LocalDate dob = LocalDate.parse(employee.getDob());
		employee.setAge(Period.between(dob, LocalDate.now()).getYears());
		return employeeDao.updateEmployee(employee);
	}

	public Employee findEmployee(int id) {
		return employeeDao.findEmployee(id);
	}

	public void deleteEmployee(Employee employee) {
		employeeDao.deleteEmployee(employee);
	}

	public List<Employee> findAllEmployees() {
		return employeeDao.findAll();
	}
}
