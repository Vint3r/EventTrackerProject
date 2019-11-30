package com.skilldistillery.animetracker.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.animetracker.entities.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{

}
