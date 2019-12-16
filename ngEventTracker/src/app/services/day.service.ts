import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { catchError } from 'rxjs/operators';
import { throwError } from 'rxjs';
import { Day } from '../models/day';

@Injectable({
  providedIn: 'root'
})
export class DayService {

  private baseUrl = 'http://localhost:8084/';
  private url = this.baseUrl + 'api/days/';

  constructor(private http: HttpClient) { }

  getAllDays() {
    return this.http.get<Day[]>(this.url).pipe(
      catchError((err: any) => {
        console.error(err);
        return throwError('TodoService.index(): Error retrieving todos');
      })
    );
  }
}
