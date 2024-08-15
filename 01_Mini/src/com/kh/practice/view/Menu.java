package com.kh.practice.view;

import java.util.Scanner;

import com.kh.practice.controller.DepositAndwithdrawalController;
import com.kh.practice.controller.DepositController;
import com.kh.practice.controller.SaveBoxController;
import com.kh.practice.model.vo.Account;
import com.kh.practice.model.vo.Deposit;
import com.kh.practice.model.vo.DepositAndwithdrawal;
import com.kh.practice.model.vo.SaveBox;

public class Menu {
	
	private Scanner sc = new Scanner(System.in);
	
	public DepositAndwithdrawalController dc;
	public SaveBoxController sbc;
	public DepositController dsc;
	
	public void mainmenu() {
		
		System.out.print("고객이름 : ");
		String name = sc.nextLine();
		dc = new DepositAndwithdrawalController(name);
		sbc = new SaveBoxController(name);
		dsc = new DepositController(name);
		
		while(true) {
			
			System.out.print("상품 선택 [1]입출금통장 [2]세이브박스 [3]예금 [9]종료: ");
			int product = sc.nextInt();
			sc.nextLine();
			
			switch(product) {
         		case 1 :
         			depositAndwithdrawalMenu();
         			break;
         		case 2 :
         			saveBoxMenu();
         			break;
         		case 3 :
         			depositMenu();
         			break;
         		case 9 :
         			System.out.println("종료되었습니다.");
         			return;
         		default :
         			System.out.println("상품을 잘못 선택하셨습니다.");
			}
		}
	}

	public void depositAndwithdrawalMenu() {
	
		 while (true) {
	            System.out.println("1. 입금");
	            System.out.println("2. 출금");
	            System.out.println("3. 잔액 조회");
	            System.out.println("4. 종료");
	            System.out.print("원하는 작업을 선택하세요: ");
	            int choice = sc.nextInt();
	            sc.nextLine();
	            
	            switch (choice) {
	                case 1:
	                    System.out.print("입금할 금액을 입력하세요: ");
	                    int depositAmount = sc.nextInt();
	                    dc.dw.payment = depositAmount;
	                    break;
	                case 2:
	                    System.out.print("출금할 금액을 입력하세요: ");
	                    int withdrawAmount = sc.nextInt();
	                    if(dc.dw.payment < withdrawAmount) {
	                    	System.out.println ("현재 잔액보다 출금입력금액이 더 큽니다.");
	                    	break;
	                    }
	                    dc.dw.payment -= withdrawAmount;
	                    break;
	                case 3:
	                    System.out.println("현재 잔액: " + dc.dw.payment + "원");
	                    break;
	                case 4:
	                    System.out.println("프로그램을 종료합니다.");
	                    return;
	                default:
	                    System.out.println("잘못된 선택입니다. 다시 시도하세요.");
	            }
		 }
	}
	
	public void saveBoxMenu() {
		
		System.out.print("납입 금액 : ");
		int payment = sc.nextInt();
		System.out.print("가입 기간 : ");
		int period = sc.nextInt();

		//세후이자율 = 적금 실제이율
		sbc.basicInterest(payment,period);	// 세전 이자 금액
		sbc.interestAfter(payment,period);	// 세후 이자 금액 구하기
		
		System.out.println("====== " + sbc.getName() + " 님의 상품 가입 정보 ======");
		System.out.printf("금리 : %.2f%s\n",(sbc.rate * 100),"%");
		System.out.printf("가입기간 : %d개월\n", period);
		System.out.println("만기금액(세전) : " + sbc.taxBeforeAmount() + "원");
		System.out.println("만기금액(세후) : " + sbc.taxAfterAmount() + "원");
		}

	public void depositMenu() {
		
		System.out.print("납입 금액 : ");
		int payment = sc.nextInt();
		System.out.print("가입 기간 : ");
		int period = sc.nextInt();

		//세후이자율 = 적금 실제이율
		dsc.basicInterest(payment,period);	// 세전 이자 금액
		dsc.interestAfter(payment,period);	// 세후 이자 금액 구하기
						
		System.out.println("====== " + dsc.getName() + " 님의 상품 가입 정보 ======");
		System.out.printf("금리 : %.2f%s\n",(dsc.rate * 100),"%");
		System.out.printf("가입기간 : %d개월\n", period);
		System.out.println("만기금액(세전) : " + dsc.taxBeforeAmount() + "원");
		System.out.println("만기금액(세후) : " + dsc.taxAfterAmount() + "원");
		}
	}
