package com.skilldistillery.animetracker.services;

import java.util.List;

import com.skilldistillery.animetracker.entities.Anime;
import com.skilldistillery.animetracker.entities.Category;

public interface CategoryService {
	
	public List<Category> listAllCategories();
	public Category findCategoryById(int id);
	public List<Anime> findAllAnimeByCategoryId(int id);
}
