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
        Ever wanted to impress your friends? What if you could
        show them more than one solution to the
        <a 
          href='https://en.wikipedia.org/wiki/Eight_queens_puzzle'
        >
          Eight Queens puzzle?
        </a>
        Press the Solve button to see different solutions.
      </p>
      <a 
        className='githubRepoLink'
        href='https://github.com/johnobrien8642/Eight_Queens_App'
      >
        Go to Github Repository
      </a>
    </div>
  )
}

export default Header;