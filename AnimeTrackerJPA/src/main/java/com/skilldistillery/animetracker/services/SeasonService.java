package com.skilldistillery.animetracker.services;

import java.util.List;

import com.skilldistillery.animetracker.entities.Anime;
import com.skilldistillery.animetracker.entities.Season;

public interface SeasonService {

	public List<Season> listAllSeasons();
	public Season findSeasonById(int id);
	List<Anime> findAllAnimeBySeasonId(int seasonId);
}
