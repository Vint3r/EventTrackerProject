package com.skilldistillery.animetracker.controllers;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.animetracker.entities.Anime;
import com.skilldistillery.animetracker.entities.Day;
import com.skilldistillery.animetracker.services.DayService;

@RestController
@RequestMapping("api")
public class DayController {

	@Autowired
	private DayService svc;
	
	@GetMapping("days")
	public List<Day> getAllDays() {
		return svc.listAllDays();
	}
	
	@GetMapping("days/{id}")
	public Day getDayById(@PathVariable("id") int id, HttpServletResponse resp) {
		Day day = svc.getDayById(id);
		if (day == null) {
			resp.setStatus(404);
		}
		return day;
	}
	
	@GetMapping("animes/days/{id}")
	public List<Anime> getAllAnimeByDayId(@PathVariable("id") int id, HttpServletResponse resp) {
		List<Anime> animu = svc.findAllAnimeByDayId(id);
		if(animu == null || animu.size() == 0) {
			resp.setStatus(404);
			return null;
		}
		return animu;
	}
}
