import React from 'react';
import Chessboard from './Chessboard';
import Header from './Header';

const App = () => {

  return (
    <div
      className='headerAndBoardContainer'
    >
      <Header />
      <Chessboard />
    </div>
  )
}

export default App;