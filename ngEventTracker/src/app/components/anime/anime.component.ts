import { AnimeService } from './../../services/anime.service';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Anime } from 'src/app/models/anime';
import { Category } from 'src/app/models/category';
import { Day } from 'src/app/models/day';
import { Season } from 'src/app/models/season';
import { DayService } from 'src/app/services/day.service';
import { SeasonService } from 'src/app/services/season.service';
import { CategoryService } from 'src/app/services/category.service';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-anime',
  templateUrl: './anime.component.html',
  styleUrls: ['./anime.component.css']
})
export class AnimeComponent implements OnInit {
  animeList: Anime[] = [];
  selectedAnime = null;
  catList: Category[] = [];
  dayList: Day[] = [];
  seasonList: Season[] = [];
  upAnime: Anime = null;
  createBool = false;
  newAnime: Anime = new Anime();
  newDay: Day = new Day();
  newSeason: Season = new Season();
  createCatList: Category[] = [];

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private animeSvc: AnimeService,
    private daySvc: DayService,
    private seasonSvc: SeasonService,
    private catSvc: CategoryService
  ) {}

  ngOnInit() {
    this.reloadEverything();
    if (this.route.snapshot.paramMap.get('id')) {
      this.animeSvc
        // tslint:disable-next-line: radix
        .getAnimeById(parseInt(this.route.snapshot.paramMap.get('id')))
        .subscribe(
          data => {
            this.selectedAnime = data;
            console.log(this.selectedAnime);
            if (this.selectedAnime === null) {
              this.router.navigateByUrl('/**');
            }
          },
          err => {
            this.router.navigateByUrl('/**');
            console.log('');
            console.log(err);
          }
        );
    }
  }

  reloadEverything() {
    this.reloadCats();
    this.reloadDays();
    this.reloadSeasons();
    this.reloadAnime();
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

  reloadSeasons() {
    this.seasonSvc.getAllSeasons().subscribe(
      dataIn => {
        this.seasonList = dataIn;
      },
      err => {
        console.log(
          'reloadSeasons(): AnimeComponent, problem loading season list'
        );
        this.router.navigateByUrl('/**');
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

  updateSetup() {
    if (this.selectedAnime !== null) {
      this.upAnime = this.selectedAnime;
      this.selectedAnime = null;
    }
    // tslint:disable-next-line: prefer-for-of
    for (let i = 0; i < this.catList.length; i++) {
      // tslint:disable-next-line: prefer-for-of
      for (let k = 0; k < this.upAnime.categories.length; k++) {
        if (this.catList[i].id === this.upAnime.categories[k].id) {
          this.catList[i].selected = true;
        } else {
          continue;
        }
      }
    }
  }

  updateAnime(bool?: boolean) {
    console.log(this.upAnime.day);
    console.log(this.upAnime.season);
    this.animeSvc.updateAnime(this.upAnime).subscribe(
      data => {
        if (bool) {
          this.selectedAnime = this.upAnime;
          this.upAnime = null;
          this.reloadEverything();
        } else {
          this.updateSetup();
        }
      },
      err => {
        this.router.navigateByUrl('/**');
        console.error('AnimeComponent.updateAnime(): error updating anime');
        console.error(err);
      }
    );
  }

  changeCatSelected(cat: Category, upAnime: Anime) {
    if (cat.selected === true) {
      cat.selected = false;
      // tslint:disable-next-line: prefer-for-of
      for (let i = 0; i < upAnime.categories.length; i++) {
        if (cat.id === upAnime.categories[i].id) {
          upAnime.categories.splice(i, 1);
          this.updateAnime();
          this.reloadCats();
          this.updateSetup();
        }
      }
    } else {
      cat.selected = true;
      upAnime.categories.push(cat);
      this.updateAnime();
    }
  }

  changeSeason(season: Season) {
    console.log(season);
    this.upAnime.season.id = season.id;
    this.upAnime.season.name = season.name;
    this.updateAnime(true);
  }

  changeDay(day: Day) {
    console.log(day);
    this.upAnime.day.id = day.id;
    this.upAnime.day.name = day.name;
    this.updateAnime(true);
  }

  delete() {
    this.animeSvc.deleteAnime(this.selectedAnime).subscribe(
      data => {
        this.selectedAnime = null;
      },
      err => {
        this.router.navigateByUrl('/**');
        console.log('AnimeComponent.delete(): problem with deleting an anime');
        console.log(err);
      }
    );
  }

  create(form: NgForm) {
    this.newAnime.title = form.value.title;
    this.newAnime.description = form.value.description;
    this.newAnime.imgUrl = form.value.imgUrl;
    this.newAnime.interested = form.value.interested;
    this.newAnime.simulcast = form.value.simulcast;
    this.newAnime.season = new Season();
    this.newAnime.season.id = form.value.season;
    this.newAnime.day = new Day();
    this.newAnime.day.id = form.value.day;
    this.newAnime.year = form.value.year;
    this.newAnime.categories = [];
    // tslint:disable-next-line: prefer-for-of
    for (let i = 0; i < this.createCatList.length; i++) {
      this.newAnime.categories.push(this.createCatList[i]);
    }
    this.animeSvc.createAnime(this.newAnime).subscribe(
      data => {
        this.selectedAnime = this.newAnime;
        this.newAnime = null;
        this.createBool = false;
        this.reloadEverything();
      },
      err => {
        this.router.navigateByUrl('/**');
        console.error('AnimeComponent.create(): error updating anime');
        console.error(err);
      }
    );
  }

  changeCatCreate(cat: Category) {
    if (cat.selected === true) {
      cat.selected = false;

      for (let i = 0; i < this.createCatList.length; i++) {
        if (cat.id === this.createCatList[i].id) {
          this.createCatList.splice(i, 1);
        } else {
          this.createCatList[i].selected = true;
        }
      }

      // tslint:disable-next-line: prefer-for-of
      for (let i = 0; i < this.catList.length; i++) {
        const category = this.catList[i];
        // tslint:disable-next-line: prefer-for-of
        for (let k = 0; k < this.createCatList.length; k++) {
          if (this.createCatList[k].id === this.catList[i].id) {
            this.catList[i].selected = true;
          }
        }
      }
    } else {
      cat.selected = true;
      this.createCatList.push(cat);
    }
  }

  searchById(form: NgForm) {
    this.animeSvc.getAnimeById(form.value.id).subscribe(
      data => {
        const anime = data;
        this.selectedAnime = anime;
      },
      err => {
        this.router.navigateByUrl('/**');
        console.error('AnimeComponent.searchById(): error updating anime');
        console.error(err);
      }
    );
  }
}
