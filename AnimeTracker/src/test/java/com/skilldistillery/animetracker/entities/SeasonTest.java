package com.skilldistillery.animetracker.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class SeasonTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Season season;
	

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
		season = em.find(Season.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em = null;
		season = null;
	}
	
	@Test
	@DisplayName("Testing for correct basic field information pulled back from the database")
	void testSeason() {
		assertNotNull(season);
		assertEquals(1, season.getId());
		assertTrue(season.getName().equalsIgnoreCase(""));
	}

}
