import React from 'react';

//If initial results haven't come in yet 
//or loading is set to true display the 
//loading board. When results come in, display
//solved board.
const renderBoard = (results, loading) => {
  var board = []

  if (!results || loading) {
    <div className='loading'/>
  } else {
    for (var i=0;i<8;i++) {
      let row = []
      for (var i2=0;i2<8;i2++) {
        row.push({ row: i, col: i2 })
      }
      board.push(row)
    }
  
    return board.map(row => {
      return row.map(obj => {
        let { row, col } = obj;
        return (
          <div
            key={`${row} ${col}`}
            className={`boardRow ${row}`}

            //if row and col pair match a results sub array
            //row and col pair then place icon, otherwise keep empty
          >{queenOrEmptySpace(results, [row, col])}</div>
        )
      })
    })
  }
}

const queenOrEmptySpace = (results, arrPos) => {
  //if one of the results matches the row and column
  //of the div being rendered then place Queen
  if (results.some(subArr => subArr[0]===arrPos[0] && subArr[1]===arrPos[1])) {
    return <img src="https://img.icons8.com/ios-filled/50/000000/queen-uk.png"/>
  } else {
    return ''
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