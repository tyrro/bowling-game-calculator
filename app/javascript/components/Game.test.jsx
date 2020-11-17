import React from 'react';
import axios from 'axios';
import { shallow } from 'enzyme';

import wait from '../shared/wait';

import Game from './Game';

describe(Game, () => {
  const wrapper = shallow(<Game />);

  it('renders a input field', () => {
    expect(wrapper.find('input').length).toEqual(1);
  });

  it('shows total score after submitting on calculate button', async () => {
    axios.onGet('/games.json?q=sample_string').reply(200, { totalScore: 100 });
    wrapper.find('input').simulate('change', { target: { value: 'sample_string' } });
    wrapper.find('form').simulate('submit', { preventDefault() {} });

    await wait();
    expect(wrapper.find('div.total_score').text()).toEqual('Total Score: 100');
  });
});
