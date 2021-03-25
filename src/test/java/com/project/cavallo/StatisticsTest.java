package com.project.cavallo;

import java.time.LocalDate;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.project.cavallo.dao.StatisticsRepository;

@SpringBootTest
public class StatisticsTest {
	@Autowired
	private StatisticsRepository statisticsRepository;
	@Test
	public void getTotalOrders() {
		int total = statisticsRepository.getTotalOrders();
		System.out.println("total:"+total);
	}
	
	@Test
	public void getTotalOrdersFromDate() {
		LocalDate date = LocalDate.of(2010, 10, 2);
		int total = statisticsRepository.getTotalOrdersFromDate(date);
		System.out.println("total:"+total);		
	}
	
	@Test
	public void getTotalOrdersThisWeek() {
		int total = statisticsRepository.getTotalOrdersThisWeek();
		System.out.println("total:"+total);
	}
	
	@Test
	public void getTotalOrdersPastThirty() {
		int total = statisticsRepository.getTotalOrdersPastThirty();
		System.out.println("total:"+total);
	}
	
	@Test
	public void getYForOrderGraph() {
		LocalDate date = LocalDate.of(2021, 03, 20);
		List<Integer> total = statisticsRepository.getYForOrderGraph(date);
		System.out.println("total:"+total);
	}
	
	@Test
	public void getMostPopularFlavor() {
		String mostPopular = statisticsRepository.getMostPopularFlavor();
		System.out.println("MostPopular:"+mostPopular);
	}
	
	@Test
	public void getYForCreamGraph() {
		List<Integer> total = statisticsRepository.getYForCreamGraph();
		System.out.println("total:"+total);
	}
}
