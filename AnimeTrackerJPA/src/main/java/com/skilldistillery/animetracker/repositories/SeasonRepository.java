package com.skilldistillery.animetracker.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.animetracker.entities.Season;

public interface SeasonRepository extends JpaRepository<Season, Integer> {

}
