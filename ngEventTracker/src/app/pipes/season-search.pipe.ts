import { Pipe, PipeTransform } from '@angular/core';
import { Anime } from '../models/anime';
import { Season } from '../models/season';

@Pipe({
  name: 'seasonSearch'
})
export class SeasonSearchPipe implements PipeTransform {

  transform(list: Anime[], season: Season): Anime[] {
    const result: Anime[] = [];
    if (season.name === 'all') {
      return list;
    }
    // tslint:disable-next-line: prefer-for-of
    for (let i = 0; i < list.length; i++) {
      const anime = list[i];
      if (anime.season.name === season.name) {
        result.push(anime);
      }
    }
    return result;
  }
}
