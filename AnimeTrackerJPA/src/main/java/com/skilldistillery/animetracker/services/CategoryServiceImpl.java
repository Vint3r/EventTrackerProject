package com.skilldistillery.animetracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.animetracker.entities.Anime;
import com.skilldistillery.animetracker.entities.Category;
import com.skilldistillery.animetracker.repositories.AnimeRepository;
import com.skilldistillery.animetracker.repositories.CategoryRepository;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepository repo;
	
	@Autowired
	private AnimeRepository animeRepo;

	@Override
	public List<Category> listAllCategories() {
		return repo.findAll();
	}

	@Override
	public Category findCategoryById(int id) {
		Category cat = null;
		Optional<Category> catOpt = repo.findById(id);
		if (catOpt.isPresent()) {
			cat = catOpt.get();
		}
		return cat;
	}

	@Override
	public List<Anime> findAllAnimeByCategoryId(int id) {
		List<Anime> animu = animeRepo.findByCategoriesId(id);
		if (animu == null || animu.size() == 0) {
			return null;
		}
		return animu;
	}
}
