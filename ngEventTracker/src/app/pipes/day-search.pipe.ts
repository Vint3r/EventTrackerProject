import { Pipe, PipeTransform } from '@angular/core';
import { Anime } from '../models/anime';
import { Day } from '../models/day';

@Pipe({
  name: 'daySearch'
})
export class DaySearchPipe implements PipeTransform {
  transform(list: Anime[], day: Day): Anime[] {
    const result: Anime[] = [];
    if (day.name === 'all') {
      return list;
    }
    // tslint:disable-next-line: prefer-for-of
    for (let i = 0; i < list.length; i++) {
      const anime = list[i];
      if (anime.day.name === day.name) {
        result.push(anime);
      }
    }
    return result;
  }
}
