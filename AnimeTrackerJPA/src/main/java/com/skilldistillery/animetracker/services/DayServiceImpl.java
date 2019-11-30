package com.skilldistillery.animetracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.animetracker.entities.Anime;
import com.skilldistillery.animetracker.entities.Day;
import com.skilldistillery.animetracker.repositories.AnimeRepository;
import com.skilldistillery.animetracker.repositories.DayRepository;

@Service
public class DayServiceImpl implements DayService {
	
	@Autowired
	private DayRepository repo;
	
	@Autowired
	private AnimeRepository animeRepo;
	
	@Override
	public List<Day> listAllDays() {
		return repo.findAll();
	}

	@Override
	public Day getDayById(int id) {
		Day day = null;
		Optional<Day> dayOpt = repo.findById(id);
		if(dayOpt.isPresent()) {
			day = dayOpt.get();
		}
		return day;
	}
	
	@Override
	public List<Anime> findAllAnimeByDayId(int dayId) {
		List<Anime> animu = animeRepo.findByDayId(dayId);
		if(animu == null || animu.size() == 0) {
			return null;
		}
		return animu;
	}

}
