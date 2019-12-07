window.addEventListener('load', function(e) {
	console.log("Document loaded");
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

	var deleteButton = document.getElementById('delAnime');
	deleteButton.addEventListener('click', function(e) {
		e.preventDefault();

		var animeId = deleteButton.value;
		if (!isNaN(animeId) && animeId > 0) {
			deleteAnime(animeId);
		}
	})
}

function deleteAnime(animeId) {
	var xhr = new XMLHttpRequest();

	xhr.open('GET', 'http://localhost:8084/api/animes/' + animeId);

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status < 400) {
			var animeData = document.getElementById('animeData');
			animeData.textContent = '';
			animeData.textContent = "Anime deleted successfully!";
			var deleteButton = document.getElementById('delAnime');
			deleteButton.hidden = true;
		} else {
			var failDiv = document.getElementById('animeData');
			failDiv.textContent = '';
			failDiv.textContent = "Anime not deleted, we are sorry";
		}
	}

	xhr.send(animeId);
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

	var title = document.createElement('h1');
	title.textContent = anime.title;
	animeData.appendChild(title);

	var description = document.createElement('blockquote');
	description.textContent = anime.description;
	animeData.appendChild(description);

	var simulcast = document.createElement('p');
	simulcast.textContent = "Simlucast: " + anime.simulcast;
	animeData.appendChild(simulcast);
	animeData.appendChild(document.createElement('br'));

	var interested = document.createElement('p');
	interested.textContent = "Are you interested in this? " + anime.interested;
	animeData.appendChild(interested);
	animeData.appendChild(document.createElement('br'));

	var year = document.createElement('p');
	year.textContent = "This anime was released " + anime.season.name + " of "
			+ anime.year;
	animeData.appendChild(year);
	animeData.appendChild(document.createElement('br'));

	var day = document.createElement('p');
	day.textContent = "Airs on: " + anime.day.name;
	animeData.appendChild(day);

	var ul = document.createElement('ul');
	for (var i = 0; i < anime.categories.length; i++) {
		var li = document.createElement('li');
		var category = anime.categories[i];

		li.textContent = category.name;
		ul.appendChild(li);
	}
	animeData.appendChild(ul);

	var delButton = document.getElementById('delAnime');
	delButton.value = anime.id;
	delButton.hidden = false;
	delButton.textContent = '';
	delButton.textContent = 'Delete ' + anime.title + " ?"
}