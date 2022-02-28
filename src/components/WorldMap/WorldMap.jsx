import React from 'react';
import {useHistory} from 'react-router-dom';
import Button from 'react-bootstrap/Button';

function WorldMap() {

  const history = useHistory();

  // Below is a world map of WoW Classic.  There are buttons for each capital city which 
  // transport the user to a page for each city depending on which button is clicked.
  return (
    <div className="container">
      <img src="images/world_map.jpg" />
      <Button className="secondary" variant="secondary" onClick={() =>  history.push(`/city/1`)}>Darnassus</Button>
      <Button className="secondary" variant="secondary" onClick={() =>  history.push(`/city/2`)}>Ironforge</Button>
      <Button className="secondary" variant="secondary" onClick={() =>  history.push(`/city/3`)}>Stormwind City</Button>
      <Button className="secondary" variant="secondary" onClick={() =>  history.push(`/city/4`)}>Orgrimmar</Button>
      <Button className="secondary" variant="secondary" onClick={() =>  history.push(`/city/5`)}>Thunder Bluff</Button>
      <Button className="secondary" variant="secondary" onClick={() =>  history.push(`/city/6`)}>Undercity</Button>
    </div>
  );
}

export default WorldMap;
