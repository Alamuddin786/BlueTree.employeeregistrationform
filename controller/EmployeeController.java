package org.btm.controller;

import javax.servlet.http.HttpServletRequest;

import org.btm.dto.Employee;
import org.btm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;

	@RequestMapping("/load")
	public ModelAndView loadEmployee(ModelAndView view) {
		view.addObject("employee", new Employee());
		view.setViewName("register.jsp");
		return view;
	}

	@PostMapping("/employee")
	public ModelAndView saveEmployee(@ModelAttribute Employee employee, ModelAndView view, HttpServletRequest request) {

		employee = employeeService.saveEmployee(employee);
		view.addObject("message", "Employee Details Saved Succesfully");
		view.setViewName("print.jsp");
		return view;
	}

	@RequestMapping("/edit")
	public ModelAndView loade(ModelAndView view, HttpServletRequest req) {
		int id = Integer.parseInt(req.getParameter("id"));
		Employee e = employeeService.findEmployee(id);
		if (e != null) {
			view.addObject("employee", e);
			view.setViewName("edit.jsp");
			return view;
		} else {
			view.addObject("message", "User with " + id + " Not found");
			view.setViewName("print.jsp");
			return view;
		}
	}

	@RequestMapping("/update")
	public ModelAndView editEmployee(@ModelAttribute Employee employee, ModelAndView view) {
		employeeService.updateEmployee(employee);
		view.addObject("message", "Employee Details Updated Succesfully");
		view.setViewName("print.jsp");
		return view;
	}

	@RequestMapping("/delete")
	public ModelAndView deleteEmployee(ModelAndView view, HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Employee employee = employeeService.findEmployee(id);
		if (employee != null) {
			employeeService.deleteEmployee(employee);
			view.addObject("message", "Employee Details Deleted Succesfully");
			view.setViewName("print.jsp");
		} else {
			employeeService.deleteEmployee(employee);
			view.addObject("message", "Employee With ID:" + id + " not found");
			view.setViewName("print.jsp");
		}
		return view;
	}
}
