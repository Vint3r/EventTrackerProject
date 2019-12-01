package com.skilldistillery.animetracker.controllers;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.animetracker.entities.Anime;
import com.skilldistillery.animetracker.entities.Season;
import com.skilldistillery.animetracker.services.SeasonService;

@RestController
@RequestMapping("api")
public class SeasonController {

	@Autowired
	private SeasonService svc;
	
	@GetMapping("seasons")
	public List<Season> getAllDays() {
		return svc.listAllSeasons();
	}
	
	@GetMapping("seasons/{id}")
	public Season getDayById(@PathVariable("id") int id, HttpServletResponse resp) {
		Season season = svc.findSeasonById(id);
		if (season == null) {
			resp.setStatus(404);
		}
		return season;
	}
	
	@GetMapping("animes/seasons/{id}")
	public List<Anime> getAllAnimeBySeason(@PathVariable("id") int id, HttpServletResponse resp) {
		List<Anime> animu = svc.findAllAnimeBySeasonId(id);
		if(animu == null || animu.size() == 0) {
			resp.setStatus(404);
			return null;
		}
		return animu;
	}
}
