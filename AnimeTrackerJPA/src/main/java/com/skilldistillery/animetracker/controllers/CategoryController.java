package com.skilldistillery.animetracker.controllers;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.animetracker.entities.Anime;
import com.skilldistillery.animetracker.entities.Category;
import com.skilldistillery.animetracker.services.CategoryService;

@RestController
@RequestMapping("api")
public class CategoryController {

	@Autowired
	private CategoryService svc;
	
	@GetMapping("categories")//
	public List<Category> getAllDays() {
		return svc.listAllCategories();
	}
	
	@GetMapping("categories/{id}")
	public Category getDayById(@PathVariable("id") int id, HttpServletResponse resp) {
		Category cat = svc.findCategoryById(id);
		if (cat == null) {
			resp.setStatus(404);
		}
		return cat;
	}
	
	@GetMapping("animes/categories/{id}") //
	public List<Anime> getAllAnimeByCategoryId(@PathVariable("id") int id, HttpServletResponse resp) {
		List<Anime> animu = svc.findAllAnimeByCategoryId(id);
		if(animu == null || animu.size() == 0) {
			resp.setStatus(404);
			return null;
		}
		return animu;
	}
}
