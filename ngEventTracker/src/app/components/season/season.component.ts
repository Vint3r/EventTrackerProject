import { Component, OnInit } from '@angular/core';
import { Anime } from 'src/app/models/anime';
import { Category } from 'src/app/models/category';
import { Season } from 'src/app/models/season';
import { Day } from 'src/app/models/day';
import { DayService } from 'src/app/services/day.service';
import { SeasonService } from 'src/app/services/season.service';
import { AnimeService } from 'src/app/services/anime.service';
import { CategoryService } from 'src/app/services/category.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-season',
  templateUrl: './season.component.html',
  styleUrls: ['./season.component.css']
})
export class SeasonComponent implements OnInit {
  animeList: Anime[] = [];
  catList: Category[] = [];
  seasonList: Season[] = [];
  dayList: Day[] = [];
  selectedSeason: Season = null;

  constructor(
    private daySvc: DayService,
    private seasonSvc: SeasonService,
    private animeSvc: AnimeService,
    private catSvc: CategoryService,
    private route: ActivatedRoute,
    private router: Router,
  ) {}

  ngOnInit() {
    this.reloadEverything();
  }

  reloadCats() {
    this.catSvc.getAllCats().subscribe(
      dataIn => {
        this.catList = dataIn;
      },
      err => {
        this.router.navigateByUrl('/**');
        console.log(
          'reloadCats(): AnimeComponent, problem loading category list'
        );
      }
    );
  }

  reloadAnime() {
    this.animeSvc.getAllAnime().subscribe(
      dataIn => {
        this.animeList = dataIn;
      },
      err => {
        this.router.navigateByUrl('/**');
        console.log('reloadAnime(): AnimeComponent, problem loading animeList');
        console.log(err);
      }
    );
  }

  reloadDays() {
    this.daySvc.getAllDays().subscribe(
      dataIn => {
        this.dayList = dataIn;
      },
      err => {
        this.router.navigateByUrl('/**');
        console.log('reloadDays(): AnimeComponent, problem loading day list');
      }
    );
  }

  reloadSeasons() {
    this.seasonSvc.getAllSeasons().subscribe(
      dataIn => {
        this.seasonList = dataIn;
        this.seasonList.unshift({
          id: 0,
          name: 'all'
        });
      },
      err => {
        console.log(
          'reloadSeasons(): AnimeComponent, problem loading season list'
        );
        this.router.navigateByUrl('/**');
      }
    );
  }

  reloadEverything() {
    this.reloadCats();
    this.reloadAnime();
    this.reloadDays();
    this.reloadSeasons();
  }

  displayAnime(anime: Anime) {
    this.router.navigateByUrl('/animes/' + `${anime.id}`);
  }
}
