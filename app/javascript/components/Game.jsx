/* eslint-disable jsx-a11y/label-has-associated-control */
import React, { useState } from 'react';

import httpClient from '../shared/httpClient';
import routes from '../routes';

const Game = () => {
  const [inputString, setInputString] = useState('');
  const [totalScore, setTotalScore] = useState(0);

  const handleFormSubmission = async event => {
    event.preventDefault();

    const { data } = await httpClient.get(routes.games.index({ q: inputString }));
    setTotalScore(data.totalScore);
  };

  return (
    <form onSubmit={event => handleFormSubmission(event)}>
      <div className="form-group">
        <label htmlFor="gameInputString">Input String</label>
        <input
          className="form-control"
          id="gameInputString"
          onChange={event => setInputString(event.target.value)}
        />
        <div className="total_score">Total Score: {totalScore}</div>
      </div>

      <button type="submit" className="btn btn-primary btn-sm">
        Calculate
      </button>
    </form>
  );
};

export default Game;
