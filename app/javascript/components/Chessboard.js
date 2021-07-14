import React, { useState, useEffect } from 'react';
import ChessboardUtil from './util/chessboard_util';
const { renderBoard, fetchAnotherSolution } = ChessboardUtil;

const Chessboard = () => {
  let [loading, setLoading] = useState(true);
  let [error, setError] = useState('');
  let [results, setResults] = useState(null);

  useEffect(() => {
    //fetch new solution on every mount
    fetchAnotherSolution()
      .then(results => {
        //if error object set error message
        if (results instanceof Error) {
          setError(results.message)
        } else {
          setResults(results)
          setLoading(false)
        }
      })
  }, [])

  if (error) return `Error: ${error}`

  return (
    <div
      className='board'
    >
      {renderBoard(results, loading)}
    </div>
  )
}

export default Chessboard;