package com.skilldistillery.animetracker.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

@Entity
public class Anime {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String title;
	private String description;
	private Boolean simulcast;
	@Column(name = "interested_in")
	private Boolean interested;
	@Column(name = "release_year")
	private String year;
	@OneToOne
	@JoinColumn(name = "season_id")
	private Season season;
	@OneToOne
	@JoinColumn(name = "day_aired_id")
	private Day day;
	@ManyToMany
	@JoinTable(name = "anime_category", joinColumns = @JoinColumn(name = "anime_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
	private List<Category> categories;

	public Anime() {
		super();
	}

	public Anime(int id, String title, String description, Boolean simulcast, Boolean interested, String year,
			Season season, Day day, List<Category> categories) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.simulcast = simulcast;
		this.interested = interested;
		this.year = year;
		this.season = season;
		this.day = day;
		this.categories = categories;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Boolean getSimulcast() {
		return simulcast;
	}

	public void setSimulcast(Boolean simulcast) {
		this.simulcast = simulcast;
	}

	public Boolean getInterested() {
		return interested;
	}

	public void setInterested(Boolean interested) {
		this.interested = interested;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public Season getSeason() {
		return season;
	}

	public void setSeason(Season season) {
		this.season = season;
	}

	public Day getDay() {
		return day;
	}

	public void setDay(Day day) {
		this.day = day;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((categories == null) ? 0 : categories.hashCode());
		result = prime * result + ((day == null) ? 0 : day.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + id;
		result = prime * result + ((interested == null) ? 0 : interested.hashCode());
		result = prime * result + ((season == null) ? 0 : season.hashCode());
		result = prime * result + ((simulcast == null) ? 0 : simulcast.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((year == null) ? 0 : year.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Anime other = (Anime) obj;
		if (categories == null) {
			if (other.categories != null)
				return false;
		} else if (!categories.equals(other.categories))
			return false;
		if (day == null) {
			if (other.day != null)
				return false;
		} else if (!day.equals(other.day))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (id != other.id)
			return false;
		if (interested == null) {
			if (other.interested != null)
				return false;
		} else if (!interested.equals(other.interested))
			return false;
		if (season == null) {
			if (other.season != null)
				return false;
		} else if (!season.equals(other.season))
			return false;
		if (simulcast == null) {
			if (other.simulcast != null)
				return false;
		} else if (!simulcast.equals(other.simulcast))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (year == null) {
			if (other.year != null)
				return false;
		} else if (!year.equals(other.year))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Anime [id=" + id + ", title=" + title + ", description=" + description + ", simulcast=" + simulcast
				+ ", interested=" + interested + ", year=" + year + ", season=" + season + ", day=" + day + "]";
	}

}
