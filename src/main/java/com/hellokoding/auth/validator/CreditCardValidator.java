package com.hellokoding.auth.validator;


import java.util.List;
import org.springframework.stereotype.Component;
import com.hellokoding.auth.model.CreditCard;


@Component
public class CreditCardValidator {


	
	public void validate(Object o, List<String> errors) {
		CreditCard cc = (CreditCard) o;

		
		if (cc.getNumber().length() < 10 || cc.getNumber().length() > 10) {
			errors.add("Invalid credit card");
		}
	
	}
}
