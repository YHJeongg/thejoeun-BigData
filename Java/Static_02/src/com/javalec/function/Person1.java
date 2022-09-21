package com.javalec.function;

public class Person1 {

    public int inputPerson1 = 0;

    public Person1() {

    }

    public int giftPerson1(int inputPerson1) {
        
        Gift.gift = Gift.gift - inputPerson1;

        if(Gift.gift <= 0) {
            System.out.println("남은 선물 갯수가 없습니다.");
            System.exit(0);
        } else {
            System.out.println("남은 선물 갯수는 " + Gift.gift + "개 입니다.");
        }
        return Gift.gift;
        
    }
    
}
