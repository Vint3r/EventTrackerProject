import { Season } from './season';
import { Category } from './category';
import { Day } from './day';

export class Anime {
  id: number;
  title: string;
  description: string;
  simulcast: boolean;
  imgUrl: string;
  interested: boolean;
  year: string;
  season: Season;
  day: Day;
  categories: Category[];

  constructor(
    id?: number,
    title?: string,
    description?: string,
    simulcast?: boolean,
    imgUrl?: string,
    interested?: boolean,
    year?: string,
    season?: Season,
    day?: Day,
    categories?: Category[]
  ) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.simulcast = simulcast;
    this.imgUrl = imgUrl;
    this.interested = interested;
    this.year = year;
    this.season = season;
    this.day = day;
    this.categories = categories;
  }
}
