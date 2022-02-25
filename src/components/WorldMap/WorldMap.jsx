import React from 'react';
import {useHistory} from 'react-router-dom';

function WorldMap() {

  const history = useHistory();

  // Below is a world map of WoW Classic.  There are buttons for each capital city which 
  // transport the user to a page for each city depending on which button is clicked.
  return (
    <div className="container">
      <img src="images/world_map.jpg" />
      <button onClick={() =>  history.push(`/city/1`)}>Darnassus</button>
      <button onClick={() =>  history.push(`/city/2`)}>Ironforge</button>
      <button onClick={() =>  history.push(`/city/3`)}>Stormwind City</button>
      <button onClick={() =>  history.push(`/city/4`)}>Orgrimmar</button>
      <button onClick={() =>  history.push(`/city/5`)}>Thunder Bluff</button>
      <button onClick={() =>  history.push(`/city/6`)}>Undercity</button>
    </div>
  );
}

// this allows us to use <App /> in index.js
export default WorldMap;
