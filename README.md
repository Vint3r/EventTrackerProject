# EventTrackerProject

## Overview
---

A anime site to track upcoming shows including release dates, air dates, and basic information regarding them.

### Description
---

Just the back end is created right now, but 16 api mappings have been created and are displayed in the table following this brief description. The site itself when completed will be mostly used for tracking upcoming or already released anime, and can be used very similarly to a tv guide almost. Allowing users to get a brief description of any of the anime in the database and then allowing them to choose if they are interested in them or not. If they decide to "follow" a show it will be displayed for them as a reminder for when the shows are airing and so on.

Created a javascript ran front end finishing the site. As described above it allows for users to keep a 'tracker' on anime coming out. Allowing users to search via several methods to narrow down their search results to easily keep an eye on shows they want to watch, even including a search for animes that you have already selected as wanting to watch.

### Api mapping chart
---

| Return Type     | Route                           | Functionality                         |
|-----------------|---------------------------------|---------------------------------------|
| `List<Anime>`   |`GET api/animes`                 | Gets all anime                        |
| `List<Anime>`   |`GET api/animes/search/{keyword}`| Searches for list by keyword          |
| `List<Anime>`   |`GET api/animes/interested`      | Searches for all interested anime     |
| `List<Anime>`   |`GET api/animes/seasons/{id}`    | Gets list of anime by season id       |
| `List<Anime>`   |`GET api/animes/categories/{id}` | Gets list of anime by category id     |
| `List<Anime>`   |`GET api/animes/days/{id}`       | Gets list of anime by day id          |
| `Anime`         |`GET api/animes/{id}`            | Gets one anime by id                  |
| `Anime`         |`POST api/animes`                | Creates a new anime                   |
| `Anime`         |`PUT api/animes/{id}`            | Updates a given anime                 |
| `void`          |`DELETE api/animes/{id}`         | Deletes an existing anime by id       |
| `List<Season>`  |`GET api/seasons`                | Gets all seasons                      |
| `Season`        |`GET api/seasons/{id}`           | Gets one season by id                 |
| `List<Category>`|`GET api/categories`             | Gets all categories                   |
| `Category`      |`GET api/categories/{id}`        | Gets one category by id               |
| `List<Day>`     |`GET api/days`                   | Gets all days                         |
| `Day`           |`GET api/days/{id}`              | Gets one day by id                    |

### Lessons learned
---

So far I have learned that REST looks like it can really help organize my controllers and help greatly with pulling information from the front end of the site. I am personally looking forward to working with it more along with Repo's and other technologies given to use from the JPA libraries. All together really streamlining and simplifying the whole design of the back end. All in all I didn't have too many issues with this project, mostly just issues with tedious error checking by sending in junk information. Slowly chipping away at it and adding more error checks.

Creating the javascript front end was a bigger task than I was originally expecting, and because of that I am sure there are some ways I did some things a bit weird. For instance I had a issue early on with creating the update form, coming from the fact that all data from the database is grabbed asynchronously and none of the information existed when I needed it. To get around this problem I had all the information I needed grabbed from the moment the web page loads and is then stored in a global variable for me to call whenever I needed it.
