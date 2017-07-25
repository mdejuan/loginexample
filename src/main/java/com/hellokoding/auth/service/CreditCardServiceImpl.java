package com.hellokoding.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellokoding.auth.model.CreditCard;
import com.hellokoding.auth.repository.CreditCardRepository;
@Service
public class CreditCardServiceImpl implements CreditCardService{
	@Autowired
	private CreditCardRepository creditCardRepository;

	@Override
	public CreditCard save(CreditCard creditCard) {
		
			return creditCardRepository.save(creditCard);
		
	}

	@Override
	public List<CreditCard> findAllFilter(String creditCard) {
		return creditCardRepository.findAllFilter(creditCard);
	}

	@Override
	public CreditCard find(String number) {
		
		return creditCardRepository.findCreditCard(number);
	}
}
