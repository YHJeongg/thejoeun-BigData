package com.javalec.base;

import java.util.HashMap;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		HashMap<Integer, String> hashMap = new HashMap<Integer, String>();
		hashMap.put(10, "str10");
		hashMap.put(11, "str11");
		hashMap.put(12, "str12");

		System.out.println(hashMap);
		System.out.println(hashMap.get(10));

		hashMap.remove(11);
		System.out.println(hashMap.get(11));

		hashMap.clear();

	}

}
