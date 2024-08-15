package com.kh.practice.model.vo;

public class Account {
	
	protected String name;	//고객이름
	public int period;		//가입기간
	public int payment;	//납입금액
	public double rate;	//금리
	protected int taxBeforeAmount; //세전만기금액
	protected int taxAfterAmount;	//세후만기금액
	protected int interest;	//이자금액
	protected int interestAfter; //세후이자금액
	protected double rateAfter; //세후이자율
	
	public Account() {}
	public Account(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	// 세전 이자 금액
    public int basicInterest(int payment, int period) {
        this.payment = payment;
        this.period = period;
        int sum = 0;
        for(int i = period; i > 0; i--) {
            interest = (int)(payment * rate) * i / period;
            sum += interest;
        }
        return sum;
    }
    
    // 세후 이자 금액
    public int interestAfter(int payment, int period) {
        this.payment = payment;
        this.period = period;
        int sum = 0;
        for(int i = period; i > 0; i--) {
        	interestAfter = (int)(payment * rateAfter(period)) * i / period;
            sum += interestAfter;
        }
        return sum;
    }
    
    // 세전 만기 금액 구하기
    public int taxBeforeAmount() {
        taxBeforeAmount = payment * period + basicInterest(payment, period);
        return taxBeforeAmount;
    }
    
    // 세후 만기 금액 구하기
    public int taxAfterAmount() {
    	taxAfterAmount = payment * period + interestAfter(payment, period);
        return taxAfterAmount;
    }
    
    // 적금 실제 이율 구하기
    public double rateAfter(int period) {
    	rateAfter = (rate * (period + 1) / 12) * (1 - 0.154); //일반세율 15.4%, 기본 12개월기준
        return rateAfter;
    }
}
