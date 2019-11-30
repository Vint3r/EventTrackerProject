package com.skilldistillery.animetracker.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.animetracker.entities.Anime;
import com.skilldistillery.animetracker.entities.Category;

public interface AnimeRepository extends JpaRepository<Anime, Integer> {

	public List<Anime> findByTitleLikeOrDescriptionLike(String title, String description);
	public List<Anime> findBySeasonId(int seasonId);
	public List<Anime> findByCategoriesId(int catId);
	public List<Anime> findByDayId(int dayId);
	
}
