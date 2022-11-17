package com.javalec.base;

import java.util.ArrayList;

public class Main {

	public static void main(String[] args) {
		
		ArrayList<Customer> arrayCustomer = new ArrayList<>();

		Customer customer = new Customer(1, "James", "010-1111-2222");
		arrayCustomer.add(customer);

		Customer customer2 = new Customer();
		customer2.setNumber(2);
		customer2.setName("Cathy");
		customer2.setPhone("010-7777-8888");
		arrayCustomer.add(customer2);

		System.out.println(arrayCustomer.get(0).getName());
  
	}

}
