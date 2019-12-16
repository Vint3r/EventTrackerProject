import { Injectable } from '@angular/core';
import { throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Anime } from '../models/anime';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class AnimeService {
  private baseUrl = 'http://localhost:8084/';
  private url = this.baseUrl + 'api/animes';
  constructor(private http: HttpClient) {}

  public getAllAnime() {
    // const httpOptions = {
    //   headers: {
    //     'X-Requested-With': 'XMLHttpRequest',
    //     'Access-Control-Allow-Origin': 'http://localhost:8084',
    //     'Access-Control-Allow-Methods': 'GET, POST, PATCH, PUT, DELETE, OPTIONS',
    //     'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
    //   }
    // };
    return this.http.get<Anime[]>(this.url).pipe(
      catchError((err: any) => {
        console.error(err);
        return throwError('TodoService.index(): Error retrieving todos');
      })
    );
  }

  public updateAnime(upAnime: Anime) {
    const httpOptions = {
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'Content-type': 'application/json'
      }
    };
    console.log(upAnime);
    return this.http.put(`${this.url}/${upAnime.id}`, upAnime, httpOptions).pipe(
      catchError((err: any) => {
        console.error(err);
        return throwError('AnimeService.updateAnime(): Error updating anime');
      })
    );
  }

  public deleteAnime(anime: Anime) {
    return this.http.delete(`${this.url}/${anime.id}`).pipe(
      catchError((err: any) => {
        console.error(err);
        return throwError('AnimeService.deleteAnime(): Error deleting anime');
      })
    );
  }

  public createAnime(anime: Anime) {
    const httpOptions = {
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'Content-type': 'application/json'
      }
    };
    return this.http.post(this.url, anime, httpOptions).pipe(
      catchError((err: any) => {
        console.error(err);
        return throwError('AnimeService.createAnime(): Error creating anime');
      })
    );
  }

  public getAnimeById(id: number) {
    return this.http.get<Anime[]>(`${this.url}/${id}`).pipe(
      catchError((err: any) => {
        console.error(err);
        return throwError('AnimeService.getAnimeById(): Error retrieving anime');
      })
    );
  }
}
