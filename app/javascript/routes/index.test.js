import routes from './index';

describe('routes', () => {
  test('supports the required query params and format', () => {
    expect(routes.games.index()).toEqual('/games.json');
  });
});
