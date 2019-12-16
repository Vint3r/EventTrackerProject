import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AnimeComponent } from './components/anime/anime.component';
import { CategoryComponent } from './components/category/category.component';
import { SeasonComponent } from './components/season/season.component';
import { DayComponent } from './components/day/day.component';
import { NavBarComponent } from './components/nav-bar/nav-bar.component';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { EvenCatIdPipe } from './pipes/even-cat-id.pipe';
import { SwitchedSelectedPipe } from './pipes/switched-selected.pipe';
import { ErrorPageComponent } from './components/error-page/error-page.component';
import { HomePageComponent } from './components/home-page/home-page.component';
import { CatSearchPipe } from './pipes/cat-search.pipe';
import { DaySearchPipe } from './pipes/day-search.pipe';
import { SeasonSearchPipe } from './pipes/season-search.pipe';

@NgModule({
  declarations: [
    AppComponent,
    AnimeComponent,
    CategoryComponent,
    SeasonComponent,
    DayComponent,
    NavBarComponent,
    EvenCatIdPipe,
    SwitchedSelectedPipe,
    ErrorPageComponent,
    HomePageComponent,
    CatSearchPipe,
    DaySearchPipe,
    SeasonSearchPipe
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
