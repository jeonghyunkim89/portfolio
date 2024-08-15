package com.kh.practice.model.vo;

public class Deposit extends Account {
	
	
	public Deposit(String name){
		this.name = name;
		rate = 0.033;
	}

	@Override
	public int basicInterest(int payment, int period) {	//세전 이자 금액
		 this.payment = payment;
		 this.period = period;
		 interest = (int)(payment * rate) * period / 12;
		 return interest;    
	}

	@Override
	public int interestAfter(int payment, int period) {	//세후 이자 금액
		interestAfter = interest - (int)(interest * 0.154); //일반세율 15.4%, 기본 12개월기준
		return interestAfter;
	}

	@Override
	public int taxBeforeAmount() {	//세전 만기 금액
		taxBeforeAmount = payment + interest;
		return taxBeforeAmount;
	}

	@Override
	public int taxAfterAmount() {	//세후 만기 금액
		taxAfterAmount = payment + interestAfter;
		return taxAfterAmount;
	}

	@Override
	public double rateAfter(int period) {	//실제 이율 구하기
		return super.rateAfter(period);
	}
}

