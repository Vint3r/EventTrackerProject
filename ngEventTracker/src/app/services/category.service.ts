import { Injectable } from '@angular/core';
import { Category } from '../models/category';
import { throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  private baseUrl = 'http://localhost:8084/';
  private url = this.baseUrl + 'api/categories/';

  constructor(private http: HttpClient) {}

  getAllCats() {
    return this.http.get<Category[]>(this.url).pipe(
      catchError((err: any) => {
        console.error(err);
        return throwError('TodoService.index(): Error retrieving todos');
      })
    );
  }
}
