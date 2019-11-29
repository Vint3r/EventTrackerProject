package com.skilldistillery.animetracker.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class DayTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Day day;
	

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("AnimeDB");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf = null;
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		day = em.find(Day.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em = null;
		day = null;
	}
	
	@Test
	@DisplayName("Testing for correct basic field information coming back from the database")
	void testDay() {
		assertNotNull(day);
		assertTrue(day.getName().equalsIgnoreCase("Monday"));
		assertEquals(1, day.getId());
	}

}
