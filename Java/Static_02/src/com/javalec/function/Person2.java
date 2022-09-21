package com.javalec.function;

public class Person2 {

    public int inputPerson2 = 0;
    
    public Person2() {
        
    }

    public int giftPerson2(int inputPerson2) {

        Gift.gift = Gift.gift - inputPerson2;

        if(Gift.gift <= 0) {
            System.out.println("남은 선물 갯수가 없습니다.");
        } else {
            System.out.println("남은 선물 갯수는 " + Gift.gift + "개 입니다.");
        }
        return Gift.gift;
    }
    
}
