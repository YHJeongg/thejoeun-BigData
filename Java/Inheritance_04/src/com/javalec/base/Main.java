package com.javalec.base;

public class Main {

    public static void main(String[] args) {

        System.out.println("Shop1---------------------");
        StoreHQ shop1 = new StoreShop1();

        shop1.orderKim();
        shop1.orderBu();
        shop1.orderBi();
        shop1.orderSoon();
        shop1.orderKong();
    }

}