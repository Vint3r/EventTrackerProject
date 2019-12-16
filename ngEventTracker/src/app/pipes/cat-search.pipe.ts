import { Pipe, PipeTransform } from '@angular/core';
import { Category } from '../models/category';
import { Anime } from '../models/anime';

@Pipe({
  name: 'catSearch'
})
export class CatSearchPipe implements PipeTransform {

  transform(list: Anime[], cat: Category): Anime[] {
    const result: Anime[] = [];
    if (cat.name === 'all') {
      return list;
    }
    // tslint:disable-next-line: prefer-for-of
    for (let i = 0; i < list.length; i++) {
      const anime = list[i];
      // tslint:disable-next-line: prefer-for-of
      for (let k = 0; k < anime.categories.length; k++) {
        if (anime.categories[k].name === cat.name) {
          result.push(anime);
        }
      }
    }
    return result;
  }

}
