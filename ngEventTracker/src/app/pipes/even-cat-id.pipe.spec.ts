import { EvenCatIdPipe } from './even-cat-id.pipe';

describe('EvenCatIdPipe', () => {
  it('create an instance', () => {
    const pipe = new EvenCatIdPipe();
    expect(pipe).toBeTruthy();
  });
});
