import { Anime } from './anime';

export class Category {

  id: number;
  name: string;
  selected: boolean;
  animu: Anime[];

  constructor(id?: number, name?: string, animu?: Anime[]) {
    this.id = id;
    this.name = name;
    this.animu = animu;
  }
}
