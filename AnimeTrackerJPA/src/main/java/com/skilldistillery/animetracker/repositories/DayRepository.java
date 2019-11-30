package com.skilldistillery.animetracker.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.animetracker.entities.Day;

public interface DayRepository extends JpaRepository<Day, Integer> {

}
