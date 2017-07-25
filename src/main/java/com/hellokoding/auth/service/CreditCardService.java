package com.hellokoding.auth.service;

import java.util.List;

import com.hellokoding.auth.model.CreditCard;

public interface CreditCardService {
	
	CreditCard save(CreditCard creditCard);
	CreditCard find(String number);
	
	List<CreditCard> findAllFilter(String creditCard);

}
