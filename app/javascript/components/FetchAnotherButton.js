import React from 'react';
import ChessboardUtil from './util/chessboard_util';
const { fetchAnotherSolution } = ChessboardUtil;

const FetchAnotherButton = ({
  setError,
  setLoading,
  setResults
}) => {

  return (
    <button
      className='fetchAnotherBtn d-block border rounded px-3 py-2 mx-auto mt-3'
      onClick={() => {
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
      }}
    >
      Solve
    </button>
  )
}

export default FetchAnotherButton;