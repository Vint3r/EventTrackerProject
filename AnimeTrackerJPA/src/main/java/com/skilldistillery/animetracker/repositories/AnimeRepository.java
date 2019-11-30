package com.skilldistillery.animetracker.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.animetracker.entities.Anime;

public interface AnimeRepository extends JpaRepository<Anime, Integer> {

}
