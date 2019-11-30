package com.skilldistillery.animetracker.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "category")
	private String name;
	@JsonIgnore
	@ManyToMany(mappedBy = "categories")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Anime> animu;

	public Category() {
		super();
	}

	public Category(int id, String name, List<Anime> animu) {
		super();
		this.id = id;
		this.name = name;
		this.animu = animu;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String category) {
		this.name = category;
	}

	public List<Anime> getAnimu() {
		return animu;
	}

	public void setAnimu(List<Anime> animu) {
		this.animu = animu;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((animu == null) ? 0 : animu.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + id;
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
		Category other = (Category) obj;
		if (animu == null) {
			if (other.animu != null)
				return false;
		} else if (!animu.equals(other.animu))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", category=" + name + "]";
	}
	
	public void addAnime(Anime anime) {
		if (animu == null) {
			animu = new ArrayList<>();
		}
		
		if (!animu.contains(anime)) {
			animu.add(anime);
			anime.addCategory(this);
		}
	}
	
	public void removeAnime(Anime anime) {
		if (animu != null && animu.contains(anime)) {
			animu.remove(anime);
			anime.removeCategory(this);
		}
	}
}
