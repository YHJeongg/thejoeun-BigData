package com.javalec.function;

public class TwoNumberCalc {
	
	// Field
	
	// Constructor
	public TwoNumberCalc() {
		
	}
	
	// Method
	// 덧셈
	public String addition(String str1, String str2) {
		String intStr1 = str1.replaceAll("[^0-9]", "");
		String intStr2 = str2.replaceAll("[^0-9]", "");
        return Integer.toString(Integer.parseInt(intStr1) + Integer.parseInt(intStr2));
    }

	public String subtraction(String str1, String str2) {
        return Integer.toString(Integer.parseInt(str1) - Integer.parseInt(str2));
    }

	public String multiplication(String str1, String str2) {
        return Integer.toString(Integer.parseInt(str1) * Integer.parseInt(str2));
    }

	public String division(String str1, String str2) {
        return String.format("%.3f", (double)Integer.parseInt(str1) / Integer.parseInt(str2));
    }

}
