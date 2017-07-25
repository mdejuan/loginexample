package com.hellokoding.auth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.hellokoding.auth.model.CreditCard;

public interface CreditCardRepository extends JpaRepository<CreditCard, Long>{
	@Query("select distinct c from CreditCard as c where c.number = ?1")
	List<CreditCard> findAllFilter(String text);
	
	@Query("select distinct c from CreditCard as c where c.number = ?1")
	CreditCard findCreditCard(String number);
	

}
