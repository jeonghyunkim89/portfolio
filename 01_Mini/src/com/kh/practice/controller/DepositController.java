package com.kh.practice.controller;

import com.kh.practice.model.vo.Deposit;

public class DepositController {

	public Deposit d;
	public double rate = 0.033;

	public DepositController(String name) {
		d = new Deposit(name);
	}

	public void basicInterest(int payment, int period) {
		d.basicInterest(payment, period);
	}

	public void interestAfter(int payment, int period) {
		d.interestAfter(payment, period);
	}

	public String taxBeforeAmount() {
		return String.valueOf(d.taxBeforeAmount());
	}

	public String taxAfterAmount() {
		return String.valueOf(d.taxAfterAmount());
	}
	
	public String getName() {
		return d.getName();
	}

}
