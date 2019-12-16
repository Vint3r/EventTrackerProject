import { Pipe, PipeTransform } from '@angular/core';
import { Category } from '../models/category';

@Pipe({
  name: 'evenCatId'
})
export class EvenCatIdPipe implements PipeTransform {

  transform(cat: Category): any {
    let bool = false;

    if (cat.id % 2 === 0) {
      bool = true;
    }

    return bool;
  }

}
