package com.hellokoding.auth.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.hellokoding.auth.model.CreditCard;
import com.hellokoding.auth.service.CreditCardService;
import com.hellokoding.auth.service.UserService;
import com.hellokoding.auth.validator.CreditCardValidator;

@Controller
public class CreditCardController {

	@Autowired
	private CreditCardService creditCardService;
	@Autowired
	private UserService userService;


	@RequestMapping(value = "/saveCreditCard", method = RequestMethod.POST)
	public @ResponseBody List<String> save(@RequestParam String number, @RequestParam String expirationDate,
			Model model) {
		List<String> messages = new ArrayList<>();
		CreditCard creditCard = new CreditCard();
		creditCard.setNumber(number);
		CreditCardValidator validator = new CreditCardValidator();
		validator.validate(creditCard, messages);
		if (messages.isEmpty()) {
			creditCard.setNumber(number);
			Calendar calendar = Calendar.getInstance();
			calendar.clear();
			calendar.set(Calendar.MONTH, new Integer(expirationDate.substring(3, 5)));
			calendar.set(Calendar.YEAR, new Integer(expirationDate.substring(0, 2)));
			Date date = calendar.getTime();
			creditCard.setExpirationDate(date);
			UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			creditCard.setUser(userService.findByUsername(userDetails.getUsername()));
			creditCardService.save(creditCard);
			messages.add("Credit Card saved");
		}

		return messages;
	}

	@RequestMapping(value = "/searchCreditCard", method = RequestMethod.POST)
	public @ResponseBody CreditCard search(@RequestParam String number) {
		
		return creditCardService.find(number);
	}
}
