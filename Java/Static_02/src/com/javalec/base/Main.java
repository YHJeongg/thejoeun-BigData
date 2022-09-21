package com.javalec.base;

import java.util.Scanner;

import com.javalec.function.Person1;
import com.javalec.function.Person2;

public class Main {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		int inputPerson1 = 0;
		int inputPerson2 = 0;
		Person1 person1 = new Person1();
		Person2 person2 = new Person2();

		System.out.print("1번 친구에게 선물할 갯수를 입력하세요 : ");
		inputPerson1 = scanner.nextInt();
		person1.giftPerson1(inputPerson1);

		System.out.print("2번 친구에게 선물할 갯수를 입력하세요 : ");
		inputPerson2 = scanner.nextInt();
		person2.giftPerson2(inputPerson2);

		scanner.close();

	}

}
