package com.kh.practice.controller;

import com.kh.practice.model.vo.SaveBox;

public class SaveBoxController {
	
	public SaveBox sb;
	public double rate = 0.02;

	public SaveBoxController(String name) {
		sb = new SaveBox(name);
	}

	public void basicInterest(int payment, int period) {
		sb.basicInterest(payment, period);
	}

	public void interestAfter(int payment, int period) {
		sb.interestAfter(payment, period);
	}

	public String taxBeforeAmount() {
		return String.valueOf(sb.taxBeforeAmount());
	}

	public String taxAfterAmount() {
		return String.valueOf(sb.taxAfterAmount());
	}

	public String getName() {
		return sb.getName();
	}

}
