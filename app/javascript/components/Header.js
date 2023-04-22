import React from 'react';

const Header = () => {

  return (
    <div className='header container text-center mb-6 mx-auto'>
      <h1
        className='d-block my-4 mx-auto'
      >Eight Queens Puzzle Solutions</h1>
      <p
        className='w-75 mx-auto'
      >
        The <a href='https://en.wikipedia.org/wiki/Eight_queens_puzzle'>Eight Queens puzzle</a>
        is a puzzle that requires you to place 8 queens on a chessboard in a manner where no queen
        can attack another queen. f
      </p>
      <p
        className='w-75 mx-auto'
      >
        This was my first computer program and first algorithm I ever wrote! It uses a brute force
        method to place queens on the board. It works by placing queens randomly. If the space it tries to
        place a queen on is valid, it places the queen, otherwise it marks the space as invalid.
        The algorithm tracks how many invalid spaces there are--if there are more invalid spaces than possible
        valid ones, it resets the board and tries again. If it successfully places 8 valid queens, it returns the solution.
      </p>
      <p
        className='w-75 mx-auto'
      >
        The logic and backend of this program is written in Ruby, and the frontend is React. I don't consider this as a
        demonstration of either, but rather only as a simple demonstration of my ability to think algorithmically, I also leave
        this as part of my portfolio project as it has nostalgic significance for me as the first algorithm I ever wrote completely on my own.
      </p>
    </div>
  )
}

export default Header;