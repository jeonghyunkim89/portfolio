package com.kh.practice.controller;

import com.kh.practice.model.vo.Account;
import com.kh.practice.model.vo.DepositAndwithdrawal;

public class DepositAndwithdrawalController {
	
	public DepositAndwithdrawal dw;
	//public double rate = 0.001;
	
	public DepositAndwithdrawalController(String name) {
		dw = new DepositAndwithdrawal(name);
	}

	/*public void basicInterest(int payment, int period) {
		dw.basicInterest(payment, period);
	}

	public void interestAfter(int payment, int period) {
		dw.interestAfter(payment, period);
	}
	
	public String taxBeforeAmount() {
		return String.valueOf(dw.taxBeforeAmount());
	}

	public String taxAfterAmount() {
		return String.valueOf(dw.taxAfterAmount());
	}

	public String getName() {
		return dw.getName();
	}*/
}
