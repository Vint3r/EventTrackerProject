import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AnimeComponent } from './components/anime/anime.component';
import { ErrorPageComponent } from './components/error-page/error-page.component';
import { HomePageComponent } from './components/home-page/home-page.component';
import { CategoryComponent } from './components/category/category.component';
import { SeasonComponent } from './components/season/season.component';
import { DayComponent } from './components/day/day.component';


const routes: Routes = [
  { path: '', pathMatch: 'full', component: HomePageComponent},
  { path: 'animes', component: AnimeComponent},
  { path: 'animes/:id', component: AnimeComponent},
  { path: 'categories', component: CategoryComponent},
  { path: 'seasons', component: SeasonComponent},
  { path: 'days', component: DayComponent},
  { path: '**', component: ErrorPageComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
