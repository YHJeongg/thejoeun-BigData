package com.javalec.base;

public class Main {

    public static void main(String[] args) {

        // System.out.println("HQ========================");
        // StoreHQ storeHQ = new StoreHQ();
		// storeHQ.orderKim();
		// storeHQ.orderBu();
		// storeHQ.orderBi();
		// storeHQ.orderSoon();
		// storeHQ.orderKong();

        // System.out.println("Shop1========================");
        // StoreShop1 storeShop1 = new StoreShop1();
		// storeShop1.orderKim();
		// storeShop1.orderBu();
		// storeShop1.orderBi();
		// storeShop1.orderSoon();
		// storeShop1.orderKong();

        // System.out.println("Shop2========================");
        // StoreShop2 storeShop2 = new StoreShop2();
		// storeShop2.orderKim();
		// storeShop2.orderBu();
		// storeShop2.orderBi();
		// storeShop2.orderSoon();
		// storeShop2.orderKong();

        // System.out.println("Shop3========================");
        // StoreShop3 storeShop3 = new StoreShop3();
		// storeShop3.orderKim();
		// storeShop3.orderBu();
		// storeShop3.orderBi();
		// storeShop3.orderSoon();
		// storeShop3.orderKong();

        StoreHQ[] store = { new StoreHQ(), new StoreShop1(), new StoreShop2(), new StoreShop3() };
        for (int i = 0; i < store.length; i++) {
            System.out.println("----------------------");
            store[i].orderKim();
            store[i].orderBu();
            store[i].orderBi();
            store[i].orderSoon();
            store[i].orderKong();
        }
    }

}