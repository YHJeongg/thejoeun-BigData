package com.javalec.base;

public class StoreShop1 extends StoreHQ {
    
    public StoreShop1() {

    }

    @Override
    public void orderKim() {
        System.out.println("김치찌개(HQ) : 4500원");
    }
    
    @Override
    public void orderBu() {
        System.out.println("부대찌개(HQ) : 5000원");
    }

    @Override
    public void orderSoon() {
        System.out.println("순대국(HQ) : 판매하지 않습니다.");
    }

}
