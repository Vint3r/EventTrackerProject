package com.skilldistillery.animetracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.animetracker.entities.Anime;
import com.skilldistillery.animetracker.entities.Season;
import com.skilldistillery.animetracker.repositories.AnimeRepository;
import com.skilldistillery.animetracker.repositories.SeasonRepository;

@Service
public class SeasonServiceImple implements SeasonService {

	@Autowired
	private SeasonRepository repo;
	
	@Autowired
	private AnimeRepository animeRepo;
	
	@Override
	public List<Season> listAllSeasons() {
		return repo.findAll();
	}

	@Override
	public Season findSeasonById(int id) {
		Season season = null;
		Optional<Season> seasonOpt = repo.findById(id);
		if (seasonOpt.isPresent()) {
			season = seasonOpt.get();
		}
		return season;
	}
	
	@Override
	public List<Anime> findAllAnimeBySeasonId(int seasonId) {
		List<Anime> animu = animeRepo.findBySeasonId(seasonId);
		if(animu == null || animu.size() == 0) {
			return null;
		}
		return animu;
	}

}
