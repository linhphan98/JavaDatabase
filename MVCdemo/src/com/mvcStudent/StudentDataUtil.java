package com.mvcStudent;

import java.util.ArrayList;
import java.util.List;

public class StudentDataUtil {
	public static List<Student> getStudent(){
		
		// create an empty list
		List<Student> students = new ArrayList<>();
		
		// add sample data
		students.add(new Student("Mary", "Public", "mary@gmail.com")); 
		students.add(new Student("John", "Doe", "john@gmail.com")); 
		students.add(new Student("Ajay", "Rao", "ajay@gmail.com")); 
		
		// return the list
		return students;
	}
}
