var categories = '';
var days = '';
var seasons = '';

window.addEventListener('load', function(e) {
	console.log("Document loaded");
	getCategories();
	getDays();
	getSeasons();
	init();
})

function init() {
	document.lookUpId.idLookUp.addEventListener('click', function(e) {
		e.preventDefault();

		var animeId = document.lookUpId.animeId.value;
		if (!isNaN(animeId) && animeId > 0) {
			getAnimeSingle(animeId);
		}
	})

	document.allAnime.allAnimeBtn.addEventListener('click', function(e) {
		e.preventDefault();
		getAllAnime();
	})

	document.create.createBtn.addEventListener('click', function(e) {
		e.preventDefault();
		createCreateForm();
	})

	document.searchCat.catBtn.addEventListener('click', function(e) {
		e.preventDefault();
		createCategorySearch();
	})

	document.searchDay.dayBtn.addEventListener('click', function(e) {
		e.preventDefault();
		createDaySearch();
	})

	document.searchSeason.seasonBtn.addEventListener('click', function(e) {
		e.preventDefault();
		createSeasonSearch();
	})
}

function createCategorySearch() {
	animeData.textContent = '';
	let form = document.createElement('form');
	let selectCats = document.createElement('select');
	selectCats.id = "cats1";
	for (let i = 0; i < categories.length; i++) {
		let cat = categories[i];
		let catSel = document.createElement('option');
		catSel.value = cat.id;
		catSel.textContent = cat.name;
		selectCats.appendChild(catSel);
	}
	let h5 = document.createElement('h5');
	h5.textContent = "Search by Category";
	form.appendChild(h5);
	form.appendChild(selectCats);

	let searchBtn = document.createElement('button');
	searchBtn.id = "searchCat";
	searchBtn.name = "searchByCat";
	searchBtn.textContent = "Search for anime";

	btn.addEventListener('click', function(e) {
		e.preventDefault();

		let formSearch = e.target.parentElement;
		let catsDrop = formSearch.cats1;
		let cat = catsDrop.options[catsDrop.selectedIndex].value;

		getAnimeCat(cat);
	})

	form.appendChild(searchBtn);
	animeData.appendChild(form);
}

function getAnimeCat(cat) {
	var xhr = new XMLHttpRequest();

	xhr.open('GET', 'http://localhost:8084/api/animes/categories/' + cat);

	animes = '';

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status < 400) {
			animes = JSON.parse(xhr.responseText);
			displayListAnime(animes);
		} else {
			var failDiv = document.getElementById('animeData');
			failDiv.textContent = '';
			failDiv.textContent = "Anime not found, sorry 'bout that!";
		}
	}
	xhr.send(null);
}
function createDaySearch() {
	animeData.textContent = '';
	let form = document.createElement('form');
	let selectDays = document.createElement('select');
	selectDays.id = "days1";
	for (let i = 0; i < days.length; i++) {
		let day = days[i];
		let daySel = document.createElement('option');
		daySel.value = day.id;
		daySel.textContent = day.name;
		selectDays.appendChild(daySel);
	}
	let h5 = document.createElement('h5');
	h5.textContent = "Search by day aired";
	form.appendChild(h5);
	form.appendChild(selectDays);

	let searchBtn = document.createElement('button');
	searchBtn.id = "searchDay";
	searchBtn.name = "searchByDay";
	searchBtn.textContent = "Search for anime";

	btn.addEventListener('click', function(e) {
		e.preventDefault();

		let formSearch = e.target.parentElement;
		let daysDrop = formSearch.days1;
		let day = daysDrop.options[daysDrop.selectedIndex].value;

		getAnimeDay(day);
	})

	form.appendChild(searchBtn);
	animeData.appendChild(form);
}

function getAnimeDay(day) {
	var xhr = new XMLHttpRequest();

	xhr.open('GET', 'http://localhost:8084/api/animes/days/' + day);

	animes = '';

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status < 400) {
			animes = JSON.parse(xhr.responseText);
			displayListAnime(animes);
		} else {
			var failDiv = document.getElementById('animeData');
			failDiv.textContent = '';
			failDiv.textContent = "Anime not found, sorry 'bout that!";
		}
	}
	xhr.send(null);
}

function createSeasonSearch() {
	animeData.textContent = '';
	let form = document.createElement('form');
	let selectSeasons = document.createElement('select');
	selectSeasons.id = "seasons1";
	for (let i = 0; i < seasons.length; i++) {
		let season = seasons[i];
		let seasonSel = document.createElement('option');
		seasonSel.value = season.id;
		seasonSel.textContent = season.name;
		selectSeasons.appendChild(seasonSel);
	}
	let h5 = document.createElement('h5');
	h5.textContent = "Search by Season aired";
	form.appendChild(h5);
	form.appendChild(selectSeasons);

	let searchBtn = document.createElement('button');
	searchBtn.id = "searchDay";
	searchBtn.name = "searchByDay";
	searchBtn.textContent = "Search for anime";

	btn.addEventListener('click', function(e) {
		e.preventDefault();

		let formSearch = e.target.parentElement;
		let seasonsDrop = formSearch.seaons1;
		let season = daysDrop.options[seasonsDrop.selectedIndex].value;

		getAnimeSeason(season);
	})

	form.appendChild(searchBtn);
	animeData.appendChild(form);
}

function getAnimeSeasons(season) {
	var xhr = new XMLHttpRequest();

	xhr.open('GET', 'http://localhost:8084/api/animes/seasons/' + season);

	animes = '';

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status < 400) {
			animes = JSON.parse(xhr.responseText);
			displayListAnime(animes);
		} else {
			var failDiv = document.getElementById('animeData');
			failDiv.textContent = '';
			failDiv.textContent = "Anime not found, sorry 'bout that!";
		}
	}
	xhr.send(null);
}
function getCategories() {
	var xhr = new XMLHttpRequest();

	xhr.open('GET', 'http://localhost:8084/api/categories');

	categories = '';

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status < 400) {
			categories = JSON.parse(xhr.responseText);
		} else {
			var failDiv = document.getElementById('animeData');
			failDiv.textContent = '';
		}
	}
	xhr.send(null);
}

function getDays() {
	var xhr = new XMLHttpRequest();

	xhr.open('GET', 'http://localhost:8084/api/days');

	days = '';

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status < 400) {
			days = JSON.parse(xhr.responseText);
		} else {
			var failDiv = document.getElementById('animeData');
			failDiv.textContent = '';
		}
	}
	xhr.send(null);
}

function getSeasons() {
	var xhr = new XMLHttpRequest();

	xhr.open('GET', 'http://localhost:8084/api/seasons');

	seasons = '';

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status < 400) {
			seasons = JSON.parse(xhr.responseText);
		} else {
			var failDiv = document.getElementById('animeData');
			failDiv.textContent = '';
		}
	}
	xhr.send(null);
}

function deleteAnime(animeId) {
	var xhr = new XMLHttpRequest();

	xhr.open('Delete', 'http://localhost:8084/api/animes/' + animeId);

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status < 400) {
			var animeData = document.getElementById('animeData');
			animeData.textContent = '';
			animeData.textContent = "Anime deleted successfully!";
		} else {
			var failDiv = document.getElementById('animeData');
			failDiv.textContent = '';
			failDiv.textContent = "Anime not deleted, we are sorry";
		}
	}

	xhr.send(animeId);
}

function getAllAnime() {
	var xhr = new XMLHttpRequest();

	xhr.open('GET', 'http://localhost:8084/api/animes');

	var animes = '';

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status < 400) {
			animes = JSON.parse(xhr.responseText);
			displayListAnime(animes);
		} else {
			var failDiv = document.getElementById('animeData');
			failDiv.textContent = '';
			failDiv.textContent = "Anime not found, we are sorry";
		}
	}
	xhr.send(null);
}

function getAnimeSingle(animeId) {
	var xhr = new XMLHttpRequest();

	xhr.open('GET', 'http://localhost:8084/api/animes/' + animeId);

	var anime = '';

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status < 400) {
			anime = JSON.parse(xhr.responseText);
			displayAnimeSingle(anime);
		} else {
			var failDiv = document.getElementById('animeData');
			failDiv.textContent = '';
			failDiv.textContent = "Anime not found, we are sorry";
		}
	}
	xhr.send(null);
}

function displayAnimeSingle(anime) {
	var animeData = document.getElementById('animeData');
	animeData.textContent = '';

	let title = document.createElement('h1');
	title.textContent = anime.title;
	animeData.appendChild(title);

	let description = document.createElement('blockquote');
	description.textContent = anime.description;
	animeData.appendChild(description);

	let simulcast = document.createElement('p');
	simulcast.textContent = "Simlucast: " + anime.simulcast;
	animeData.appendChild(simulcast);
	animeData.appendChild(document.createElement('br'));

	let interested = document.createElement('p');
	interested.textContent = "Are you interested in this? " + anime.interested;
	animeData.appendChild(interested);
	animeData.appendChild(document.createElement('br'));

	let year = document.createElement('p');
	year.textContent = "This anime was released " + anime.season.name + " of "
			+ anime.year;
	animeData.appendChild(year);
	animeData.appendChild(document.createElement('br'));

	let day = document.createElement('p');
	day.textContent = "Airs on: " + anime.day.name;
	animeData.appendChild(day);

	let ul = document.createElement('ul');
	for (let i = 0; i < anime.categories.length; i++) {
		let li = document.createElement('li');
		let category = anime.categories[i];

		li.textContent = category.name;
		ul.appendChild(li);
	}
	animeData.appendChild(ul);

	createDeleteButton(anime);
	createUpdateButton(anime);
}

function displayListAnime(animes) {
	var animeData = document.getElementById('animeData');
	animeData.textContent = '';

	for (let i = 0; i < animes.length; i++) {
		let anime = animes[i];

		let title = document.createElement('h1');
		title.textContent = anime.title;
		animeData.appendChild(title);

		let description = document.createElement('blockquote');
		description.textContent = anime.description;
		animeData.appendChild(description);

		let simulcast = document.createElement('p');
		simulcast.textContent = "Simlucast: " + anime.simulcast;
		animeData.appendChild(simulcast);
		animeData.appendChild(document.createElement('br'));

		let interested = document.createElement('p');
		interested.textContent = "Are you interested in this? "
				+ anime.interested;
		animeData.appendChild(interested);
		animeData.appendChild(document.createElement('br'));

		let year = document.createElement('p');
		year.textContent = "This anime was released " + anime.season.name
				+ " of " + anime.year;
		animeData.appendChild(year);
		animeData.appendChild(document.createElement('br'));

		let day = document.createElement('p');
		day.textContent = "Airs on: " + anime.day.name;
		animeData.appendChild(day);

		let ul = document.createElement('ul');
		for (let k = 0; k < anime.categories.length; k++) {
			let li = document.createElement('li');
			let category = anime.categories[k];

			li.textContent = category.name;
			ul.appendChild(li);
		}
		animeData.appendChild(ul);

		createDeleteButton(anime);
		createUpdateButton(anime);
	}
}

function createDeleteButton(anime) {
	let form = document.createElement('form');
	form.name = "del";

	let delButton = document.createElement('button');

	delButton.textContent = '';
	delButton.name = "deleteAnime";
	delButton.id = "delAnime";
	delButton.hidden = false;
	delButton.value = anime.id;
	delButton.textContent = 'Delete ' + anime.title + " ?";

	delButton.addEventListener('click', function(e) {
		e.preventDefault();

		let animeId = delButton.value;
		if (!isNaN(animeId) && animeId > 0) {
			deleteAnime(animeId);
		}
	})

	form.appendChild(delButton);
	animeData.appendChild(form);
}

function createUpdateButton(anime) {
	let form = document.createElement('form');
	form.name = "upBtn";

	let upButton = document.createElement('button');

	upButton.textContent = '';
	upButton.name = "updateAnime";
	upButton.id = "upAnime";
	upButton.value = anime.id;
	upButton.textContent = 'Update ' + anime.title + " ?";

	upButton.addEventListener('click', function(e) {
		e.preventDefault();

		createUpdateForm(anime);
	})

	form.appendChild(upButton);
	animeData.appendChild(form);
}

function createUpdateForm(anime) {
	let form = document.createElement('form');
	form.name = "upForm";
	animeData.textContent = '';

	let title = document.createElement('input');
	title.type = "text";
	title.name = "title";
	title.placeholder = anime.title;
	title.textContent = "Title";
	let h5 = document.createElement('h5');
	h5.textContent = "Title:";
	form.appendChild(h5);
	form.appendChild(title);

	let description = document.createElement('input');
	description.type = "text";
	description.name = "description";
	description.placeholder = anime.description;
	description.textContent = "Description";
	h5 = document.createElement('h5');
	h5.textContent = "Description:";
	form.appendChild(h5);
	form.appendChild(description);

	let simulcast = document.createElement('input');
	simulcast.type = "checkbox";
	simulcast.name = "simulcast";
	if (anime.simulcast === true) {
		simulcast.checked = true;
	}
	h5 = document.createElement('h5');
	h5.textContent = "Simulcast (airs at the same time as japan)"
	form.appendChild(h5);
	form.appendChild(simulcast);

	let interested = document.createElement('input');
	interested.type = "checkbox";
	interested.name = "interested";
	if (anime.interested === true) {
		interested.checked = true;
	}
	h5 = document.createElement('h5');
	h5.textContent = "Interested? (Check for yes uncheck for no)";
	form.appendChild(h5);
	form.appendChild(interested);

	let year = document.createElement('input');
	year.type = "number";
	year.name = "releaseYear";
	year.textContent = "Year released";
	year.placeholder = anime.year;
	h5 = document.createElement('h5');
	h5.textContent = "Release Year:"
	form.appendChild(h5);
	form.appendChild(year);

	let selectSeasons = document.createElement('select');
	selectSeasons.textContent = "Season aired"
	selectSeasons.id = "seasons";
	let found = false;
	for (let i = 0; i < seasons.length; i++) {
		let season = seasons[i];
		let seasonSel = document.createElement('option');
		if ((season.name === anime.season.name) && found === false) {
			seasonSel.value = anime.season.id;
			seasonSel.textContent = anime.season.name;
			selectSeasons.appendChild(seasonSel);
			found = true;
			i = -1;
		}
		if (found === true && (season.name !== anime.season.name)) {
			seasonSel.value = season.id;
			seasonSel.textContent = season.name;
			selectSeasons.appendChild(seasonSel);
		}
	}
	h5 = document.createElement('h5');
	h5.textContent = "Select Season";
	form.appendChild(h5);
	form.appendChild(selectSeasons);

	let selectDays = document.createElement('select');
	selectDays.textContent = "Day its airing on"
	selectDays.id = "days";
	found = false;
	for (let i = 0; i < days.length; i++) {
		let day = days[i];
		let daySel = document.createElement('option');
		if ((day.name === anime.day.name) && found === false) {
			daySel.value = anime.day.id;
			daySel.textContent = anime.day.name;
			selectDays.appendChild(daySel);
			found = true;
			i = -1;
		}
		if ((day.name !== anime.day.name) && found === true) {
			daySel.value = day.id;
			daySel.textContent = day.name;
			console.log(daySel);
			selectDays.appendChild(daySel);
		}
	}
	h5 = document.createElement('h5');
	h5.textContent = "Select Day";
	form.appendChild(h5);
	form.appendChild(selectDays);
	h5 = document.createElement("h5");
	h5.textContent = "Category Selection";
	form.appendChild(h5);

	for (let i = 0; i < categories.length; i++) {
		let cat = document.createElement('input');
		cat.type = "checkbox";
		cat.name = "categories";
		for (let k = 0; k < anime.categories.length; k++) {
			let animeCats = anime.categories;
			let category = categories[i];
			if (animeCats[k].name === category.name) {
				cat.checked = true;
			} else {
				continue;
			}
		}
		let p = document.createElement('p');
		p.style = "display:inline";
		p.textContent = categories[i].name;
		cat.value = categories[i].id;
		cat.id = categories[i].id;
		cat.name = "categories";
		if (i % 2 === 0) {
			let br = document.createElement('br');
			form.appendChild(br);
		}
		form.appendChild(p);
		form.appendChild(cat);
	}

	let btn = document.createElement('button');
	btn.id = "upAnime";
	btn.name = "updateAnime";
	btn.value = anime.id;
	btn.textContent = "Update " + anime.title;

	btn.addEventListener('click', function(e) {
		e.preventDefault();

		let id = anime.id;
		let form = e.target.parentElement;
		let title = form.title.value;
		if (title === '') {
			title = form.title.placeholder;
		}

		let description = form.description.value;
		if (description === '') {
			description = form.description.placeholder;
		}

		let year = form.releaseYear.value;
		if (year === '') {
			year = form.releaseYear.placeholder;
		}

		let daysDrop = form.days;
		let day = daysDrop.options[daysDrop.selectedIndex].value;

		let seasonsDrop = form.seasons;
		let season = seasonsDrop.options[seasonsDrop.selectedIndex].value;

		let simulcast = form.simulcast.checked;
		let interested = form.interested.checked;

		let cats = form.categories;
		updateAnime(id, title, description, year, day, season, simulcast,
				interested, cats);
	})

	form.appendChild(document.createElement('br'));
	form.appendChild(btn);
	animeData.appendChild(form);
}

function updateAnime(id, title, description, year, day, season, simulcast,
		interested, cats) {
	var xhr = new XMLHttpRequest();
	xhr.open('PUT', 'http://localhost:8084/api/animes/' + id);
	xhr.setRequestHeader("Content-type", "application/json");

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4) {
			if (xhr.status == 200 || xhr.status == 201) {
				var data = JSON.parse(xhr.responseText);
				displayAnimeSingle(data);
			} else {
				console.log()
				console.log("PUT request failed.");
				console.error(xhr.status + ': ' + xhr.responseText);
			}
		}
	};
	let cats2 = [];
	for (let i = 0; i < cats.length; i++) {
		if (cats[i].checked) {
			cats2.push({
				id : cats[i].value
			})
		}
	}
	let upAnime = {
		id : id,
		title : title,
		description : description,
		simulcast : simulcast,
		interested : interested,
		year : year,
		season : {
			id : season
		},
		day : {
			id : day
		},
		categories : cats2
	};
	console.log(upAnime);
	let upAnimeJson = JSON.stringify(upAnime);

	xhr.send(upAnimeJson);
}

function createCreateForm() {
	let form = document.createElement('form');
	form.name = "createForm";
	animeData.textContent = '';

	let title = document.createElement('input');
	title.type = "text";
	title.name = "title";
	title.placeholder = "Enter Title";
	let h5 = document.createElement('h5');
	h5.textContent = "Title:";
	form.appendChild(h5);
	form.appendChild(title);

	let description = document.createElement('input');
	description.type = "text";
	description.name = "description";
	description.placeholder = "Enter Description";
	h5 = document.createElement('h5');
	h5.textContent = "Description:";
	form.appendChild(h5);
	form.appendChild(description);

	let simulcast = document.createElement('input');
	simulcast.type = "checkbox";
	simulcast.name = "simulcast";
	h5 = document.createElement('h5');
	h5.textContent = "Simulcast (airs at the same time as japan)"
	form.appendChild(h5);
	form.appendChild(simulcast);

	let interested = document.createElement('input');
	interested.type = "checkbox";
	interested.name = "interested";
	h5 = document.createElement('h5');
	h5.textContent = "Interested? (Check for yes uncheck for no)";
	form.appendChild(h5);
	form.appendChild(interested);

	let year = document.createElement('input');
	year.type = "number";
	year.name = "releaseYear";
	year.placeholder = 2020;
	h5 = document.createElement('h5');
	h5.textContent = "Release Year:"
	form.appendChild(h5);
	form.appendChild(year);

	let selectSeasons = document.createElement('select');
	selectSeasons.id = "seasons";
	for (let i = 0; i < seasons.length; i++) {
		let season = seasons[i];
		let seasonSel = document.createElement('option');
		seasonSel.value = season.id;
		seasonSel.textContent = season.name;
		selectSeasons.appendChild(seasonSel);
	}
	h5 = document.createElement('h5');
	h5.textContent = "Select Season";
	form.appendChild(h5);
	form.appendChild(selectSeasons);

	let selectDays = document.createElement('select');
	selectDays.id = "days";
	for (let i = 0; i < days.length; i++) {
		let day = days[i];
		let daySel = document.createElement('option');
		daySel.value = day.id;
		daySel.textContent = day.name;
		selectDays.appendChild(daySel);
	}
	h5 = document.createElement('h5');
	h5.textContent = "Select Day";
	form.appendChild(h5);
	form.appendChild(selectDays);

	h5 = document.createElement("h5");
	h5.textContent = "Category Selection";
	form.appendChild(h5);
	for (let i = 0; i < categories.length; i++) {
		let cat = document.createElement('input');
		cat.type = "checkbox";
		cat.name = "categories";

		let p = document.createElement('p');
		p.style = "display:inline";
		p.textContent = categories[i].name;
		cat.value = categories[i].id;
		cat.id = categories[i].id;
		cat.name = "categories";

		if (i % 2 === 0) {
			let br = document.createElement('br');
			form.appendChild(br);
		}

		form.appendChild(p);
		form.appendChild(cat);
	}

	let btn = document.createElement('button');
	btn.id = "crAnime";
	btn.name = "createAnime";
	btn.textContent = "Create Anime";

	btn.addEventListener('click', function(e) {
		e.preventDefault();

		let form = e.target.parentElement;
		let title = form.title.value;
		if (title === '') {
			title = form.title.placeholder;
		}
		console.log(title);
		let description = form.description.value;
		if (description === '') {
			description = form.description.placeholder;
		}
		console.log(description);
		let year = form.releaseYear.value;
		if (year === '') {
			year = form.releaseYear.placeholder;
		}
		console.log(year);
		let daysDrop = form.days;
		let day = daysDrop.options[daysDrop.selectedIndex].value;
		console.log(day);
		let seasonsDrop = form.seasons;
		let season = seasonsDrop.options[seasonsDrop.selectedIndex].value;
		console.log(season);
		let simulcast = form.simulcast.checked;
		console.log(simulcast);
		let interested = form.interested.checked;
		console.log(interested);
		let cats = form.categories;
		console.log(cats);
		createAnime(title, description, year, day, season, simulcast,
				interested, cats);
	})

	form.appendChild(document.createElement('br'));
	form.appendChild(btn);
	animeData.appendChild(form);
}

function createAnime(title, description, year, day, season, simulcast,
		interested, cats) {
	var xhr = new XMLHttpRequest();
	xhr.open('POST', 'http://localhost:8084/api/animes');
	xhr.setRequestHeader("Content-type", "application/json");

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4) {
			if (xhr.status == 200 || xhr.status == 201) {
				var data = JSON.parse(xhr.responseText);
				displayAnimeSingle(data);
			} else {
				console.log()
				console.log("POST request failed.");
				console.error(xhr.status + ': ' + xhr.responseText);
			}
		}
	};
	let cats2 = [];
	for (let i = 0; i < cats.length; i++) {
		if (cats[i].checked) {
			cats2.push({
				id : cats[i].value
			})
		}
	}
	let crAnime = {
		title : title,
		description : description,
		simulcast : simulcast,
		interested : interested,
		year : year,
		season : {
			id : season
		},
		day : {
			id : day
		},
		categories : cats2
	};
	console.log(crAnime);
	let createAnimeJson = JSON.stringify(crAnime);

	xhr.send(createAnimeJson);
}