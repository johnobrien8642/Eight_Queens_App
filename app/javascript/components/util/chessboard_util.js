import React from 'react';

//If initial results haven't come in yet 
//or loading is set to true display the 
//loading board. When results come in, display
//solved board.
const renderBoard = (results, loading) => {
  var board = []
  
  if (loading || !results) {
    return (
      <div className='loading border'>
        <div className='spinner-border' />
      </div>
    )
  } else {
    for (var i=0;i<8;i++) {
      let row = []
      for (var i2=0;i2<8;i2++) {
        row.push({ row: i, col: i2 })
      }
      board.push(row)
    }

    const handleSpaceClass = (row, column) => {
      if (column % 2 === 0 && row % 2 === 0) {
        return `space rowEven colEven`
      } else if (row % 2 !== 0 && column % 2 !== 0) {
        return `space rowOdd colOdd`
      } else {
        return 'space'
      }
    }
  
    return board.map(row => {
      return row.map(obj => {
        let { row, col } = obj;
        return (
          <div
            key={`${row} ${col}`}
            className={handleSpaceClass(row, col)}

            //if row and col pair match a results sub array
            //row and col pair then place icon, otherwise keep empty
          >{queenOrEmptySpace(results, row, col)}</div>
        )
      })
    })
  }
}

const queenOrEmptySpace = (results, row, col) => {
  //if one of the results matches the row and column
  //of the div being rendered then place Queen
  if (results.some(subArr => subArr[0]===row && subArr[1]===col)) {
    if 
      (
        (row % 2 === 0 && col % 2 === 0) || 
        (row % 2 !== 0 && col % 2 !== 0)
      ) {
        return (
          <img
          className='d-block mx-auto mt-2'
          alt='queen icon empty'
          src="https://img.icons8.com/ios/100/ffffff/queen-uk.png"
          />
          )
      } else {
        return (
          <img 
            className='d-block mx-auto mt-2'
            alt='queen icon filled'
            src="https://img.icons8.com/ios-filled/100/000000/queen-uk.png"
          />
        )
      }
  }
}

const fetchAnotherSolution = async () => {
  return fetch('chessboard/solution')
    .then(res => res.json())
    .then(data => {
      return data
    })
    .catch(error => {
      throw new Error(`${error}`)
    })
}

const ComponentUtil = {
  renderBoard,
  fetchAnotherSolution
}

export default ComponentUtil;