import { Pipe, PipeTransform } from '@angular/core';
import { Category } from '../models/category';

@Pipe({
  name: 'switchedSelected'
})
export class SwitchedSelectedPipe implements PipeTransform {

  transform(animeCat: Category[], cat: Category): any {
    return null;
  }

}
