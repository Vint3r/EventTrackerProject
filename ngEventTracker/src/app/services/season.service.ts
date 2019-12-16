import { Injectable } from '@angular/core';
import { catchError } from 'rxjs/operators';
import { throwError } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Season } from '../models/season';

@Injectable({
  providedIn: 'root'
})
export class SeasonService {

  private baseUrl = 'http://localhost:8084/';
  private url = this.baseUrl + 'api/seasons/';

  constructor(private http: HttpClient) { }

  getAllSeasons() {
    return this.http.get<Season[]>(this.url).pipe(
      catchError((err: any) => {
        console.error(err);
        return throwError('TodoService.index(): Error retrieving todos');
      })
    );
  }
}
