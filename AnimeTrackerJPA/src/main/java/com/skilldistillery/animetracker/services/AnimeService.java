package com.skilldistillery.animetracker.services;

import java.util.List;

import com.skilldistillery.animetracker.entities.Anime;

public interface AnimeService {

	public List<Anime> listAllAnime();
	public Anime getAnimeById(int id);
	public Anime createAnime(Anime anime);
	public Anime updateAnime(int id, Anime anime);
	public boolean deleteAnime(int id);
	public List<Anime> getAllAnimeByKeyword(String keyword);
}
