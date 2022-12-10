package org.btm.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.btm.dto.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@SuppressWarnings("all")
public class EmployeeDao {
	@Autowired
	EntityManager entityManager;

	public Employee saveEmployee(Employee employee) {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.persist(employee);
		entityTransaction.commit();
		return employee;
	}

	public Employee updateEmployee(Employee employee) {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.merge(employee);
		entityTransaction.commit();
		return employee;
	}

	public List<Employee> findAll() {
		Query query = entityManager.createQuery("select e from Employee e");
		List<Employee> employees = query.getResultList();
		return employees;
	}

	public void deleteEmployee(Employee employee) {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		if (employee != null) {
			entityManager.remove(employee);
		}
		entityTransaction.commit();
	}

	public Employee findEmployee(int id) {
		return entityManager.find(Employee.class, id);
	}
}
