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

class AnimeTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Anime anime;
	

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
		anime = em.find(Anime.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em = null;
		anime = null;
	}

	@Test
	@DisplayName("Testing basic fields in anime class for correct data pulled from the database")
	void testAnime() {
		assertNotNull(anime);
		assertTrue(anime.getDescription().equalsIgnoreCase(""));
		assertTrue(anime.getInterested());
		assertTrue(anime.getSimulcast());
		assertTrue(anime.getTitle().equalsIgnoreCase(""));
		assertEquals(1, anime.getYear());
	}
	
	@Test
	@DisplayName("Test mapping of Day and Anime classes")
	void testDay() {
		assertNotNull(anime.getDay());
		assertTrue(anime.getDay().getName().equalsIgnoreCase(""));
		assertEquals(1, anime.getDay().getId());
	}
	
	@Test
	@DisplayName("Test mapping of Season and Anime classes")
	void testSeason() {
		assertNotNull(anime.getSeason());
		assertTrue(anime.getSeason().getName().equalsIgnoreCase(""));
		assertEquals(1, anime.getSeason().getId());
	}
	
	@Test
	@DisplayName("Test mapping of Category and Anime classes")
	void testCategory() {
		assertNotNull(anime.getCategories());
		assertTrue(anime.getCategories().size() > 0);
		assertTrue(anime.getCategories().get(0).getName().equalsIgnoreCase(""));
		assertTrue(anime.getCategories().get(0).getName().equalsIgnoreCase(""));
		
	}

}
