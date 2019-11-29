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

class CategoryTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Category cat;
	

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
		cat = em.find(Category.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em = null;
		cat = null;
	}

	@Test
	@DisplayName("Testing for correct basic field information coming back from the database")
	void testCategory() {
		assertNotNull(cat);
		assertEquals(1, cat.getId());
		assertTrue(cat.getName().equalsIgnoreCase(""));
	}
	
	@Test
	@DisplayName("Test Category and Anime mappings for correct data coming back from the database")
	void testAnimeCat() {
		assertNotNull(cat.getAnimu());
		assertTrue(cat.getAnimu().size() > 0);
		assertTrue(cat.getAnimu().get(0).getTitle().equalsIgnoreCase(""));
		assertTrue(cat.getAnimu().get(0).getDescription().equalsIgnoreCase(""));
		assertTrue(cat.getAnimu().get(0).getYear().equals(""));
		assertTrue(cat.getAnimu().get(0).getInterested());
	}

}
