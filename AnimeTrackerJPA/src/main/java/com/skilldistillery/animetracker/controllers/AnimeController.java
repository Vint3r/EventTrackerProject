package com.skilldistillery.animetracker.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.animetracker.entities.Anime;
import com.skilldistillery.animetracker.services.AnimeService;

@RestController
@RequestMapping("api")
public class AnimeController {

	@Autowired
	private AnimeService svc;
	
	@GetMapping("animes")
	public List<Anime> getAllAnime() {
		return svc.listAllAnime();
	}
	
	@GetMapping("animes/{id}")
	public Anime getAnimeById(@PathVariable("id") int id, HttpServletResponse resp) {
		Anime anime = svc.getAnimeById(id);
		if (anime == null) {
			resp.setStatus(404);
		}
		return anime;
	}
	
	@PostMapping("animes")
	public Anime createAnAnime(@RequestBody Anime anime, HttpServletRequest req, HttpServletResponse resp) {
		try {
			anime = svc.createAnime(anime);
			resp.setStatus(201);
			StringBuffer url = req.getRequestURL();
			url.append("/").append(anime.getId());
			resp.addHeader("Location", url.toString());
		} catch (Exception e) {
			e.printStackTrace();
			resp.setStatus(400);
			return null;
			
		}
		return anime;
	}
	
	@DeleteMapping("animes/{id}")
	public void deleteAnime(@PathVariable("id") int id, HttpServletResponse resp) {
		try {
			boolean success = svc.deleteAnime(id);
			if (success == true) {
				resp.setStatus(204);
			} else {
				resp.setStatus(404);
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.setStatus(400);
		}
	}
	
	@GetMapping("animes/search/{keyword}")
	public List<Anime> animeKeywordSearch(@PathVariable("keyword") String keyword, HttpServletResponse resp) {
		List<Anime> animu = svc.getAllAnimeByKeyword(keyword);
		if(animu == null || animu.size() == 0) {
			resp.setStatus(404);
			return null;
		}
		return animu;
	}
	
	@PutMapping("animes/{id}")
	public Anime updateAnime(@PathVariable("id") int id, @RequestBody Anime anime, HttpServletResponse resp, HttpServletRequest req) {
		Anime animeUpdated = null;
		try {
			animeUpdated = svc.updateAnime(id, anime);
			if (animeUpdated == null) {
				resp.setStatus(404);
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.setStatus(400);
			return null;
		} 
		return animeUpdated;
	}
	
	@GetMapping("animes/interested")
	public List<Anime> interestedAnimes(HttpServletResponse resp) {
		List<Anime> animu = svc.findAllInterestedAnime();
		if (animu == null || animu.size() == 0) {
			resp.setStatus(404);
			return null;
		}
		return animu;
	}
	
}
