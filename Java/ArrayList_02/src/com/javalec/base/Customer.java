package com.javalec.base;

public class Customer {

	int number;
	String name;
	String phone;
	
	public Customer() {
		
	}
	
	public Customer(int number, String name, String phone) {
		super();
		this.number = number;
		this.name = name;
		this.phone = phone;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
}
