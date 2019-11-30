package com.skilldistillery.animetracker.services;

import java.util.List;

import com.skilldistillery.animetracker.entities.Anime;
import com.skilldistillery.animetracker.entities.Day;

public interface DayService {

	public List<Day> listAllDays();
	public Day getDayById(int id);
	List<Anime> findAllAnimeByDayId(int dayId);
}
