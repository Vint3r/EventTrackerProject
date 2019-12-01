package com.skilldistillery.animetracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.animetracker.entities.Anime;
import com.skilldistillery.animetracker.entities.Day;
import com.skilldistillery.animetracker.entities.Season;
import com.skilldistillery.animetracker.repositories.AnimeRepository;
import com.skilldistillery.animetracker.repositories.DayRepository;
import com.skilldistillery.animetracker.repositories.SeasonRepository;

@Service
public class AnimeServiceImp implements AnimeService {

	@Autowired
	private AnimeRepository repo;
	
	@Autowired
	private DayRepository dayRepo;
	
	@Autowired
	private SeasonRepository seasonRepo;
	
	@Override
	public List<Anime> listAllAnime() {
		return repo.findAll();
	}

	@Override
	public Anime getAnimeById(int id) {
		Anime anime = null;
		Optional<Anime> animeOpt = repo.findById(id);
		
		if(animeOpt.isPresent()) {
			anime = animeOpt.get();
		}
		return anime;
	}

	@Override
	public Anime createAnime(Anime anime) {
		repo.saveAndFlush(anime);
		return anime;
	}

	@Override
	public Anime updateAnime(int id, Anime anime) {
		Anime animeUpdate = null;
		Optional<Anime> animeOpt = repo.findById(id);
		
		if(animeOpt.isPresent()) {
			animeUpdate = animeOpt.get();
			animeUpdate.setTitle(anime.getTitle());
			animeUpdate.setDescription(anime.getDescription());
			animeUpdate.setSimulcast(anime.getSimulcast());
			animeUpdate.setInterested(anime.getInterested());
			animeUpdate.setYear(anime.getYear());
			if(anime.getCategories() != null) {
				animeUpdate.setCategories(anime.getCategories());
			}
			if(anime.getSeason() != null) {
				animeUpdate.setSeason(anime.getSeason());
			} else {
				Optional<Season> s = seasonRepo.findById(1);
				Season season = s.get();
				animeUpdate.setSeason(season);
			}
			if(anime.getDay() != null) {
				animeUpdate.setDay(anime.getDay());
			} else {
				Optional<Day> d = dayRepo.findById(8);
				Day day = d.get();
				animeUpdate.setDay(day);
			}
			repo.saveAndFlush(animeUpdate);
		}
		return animeUpdate;
	}

	@Override
	public boolean deleteAnime(int id) {
		boolean success = false;
		Anime anime = null;
		Optional<Anime> animeOpt = repo.findById(id);
		
		if(animeOpt.isPresent()) {
			anime = animeOpt.get();
			repo.delete(anime);
			success = true;
		}
		
		return success;
	}

	@Override
	public List<Anime> getAllAnimeByKeyword(String keyword) {
		System.out.println(keyword);
		keyword = "%" + keyword + "%";
		System.out.println(keyword);
		List<Anime> animu = repo.findByTitleLikeOrDescriptionLike(keyword , keyword);
		if(animu == null || animu.size() == 0) {
			return null;
		}
		return animu;
	}

	@Override
	public List<Anime> findAllInterestedAnime() {
		List<Anime> anime = repo.findByInterestedIsTrue();
		return anime;
	}

}
