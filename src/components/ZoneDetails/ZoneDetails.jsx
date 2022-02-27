import React, {useEffect} from 'react';
import {useParams, useHistory} from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';

function ZoneDetails() {

  const history = useHistory();
  const dispatch = useDispatch();
  const params = useParams();
  const selectedZone = useSelector(store => store.zone.zoneReducer);
  const selectedTowns = useSelector(store => store.zone.settlementReducer);
  const selectedDungeon = useSelector(store => store.zone.dungeonReducer);
  const id = params.zoneId;

  useEffect(() => {
    dispatch({type: 'FETCH_SETTLEMENTS', payload: {id}});
    dispatch({type: 'FETCH_DUNGEON', payload: {id}});
    dispatch({type: 'FETCH_ZONE', payload: {id}});
  }, []);
  // This page makes three dispatches to grab information about the selected zone, including all dungeons and
  // settlements located within. It then displays the dungeon and settlement information, along with a screenshot of the zone, on the DOM.
  return (
    <div className="detailsContainer">
      <h2>More Details about {selectedZone[0]?.zone}:</h2>
      <img src={selectedZone[0]?.screenshot} />
      <h2>Settlements: </h2>
      <ul>
        {selectedTowns.map(town => {
          return (
            <li key={town?.id}><h3>{town?.town}</h3>{town?.description}</li>
          );
        })}
      </ul>
      {/* Conditional rendering is used to show dungeon information if there is a dungeon in the zone.
      Otherwise, nothing is shown after the settlement information.*/}
      {selectedDungeon[0]?.id &&
        <>
          <h2>Dungeon: </h2>
          <h3>{selectedDungeon[0]?.dungeon}</h3>
          <h3>{selectedDungeon[0]?.description}</h3>
          <h3>Level Range: {selectedDungeon[0]?.min_level} - {selectedDungeon[0]?.max_level}</h3>
        </>
      }
      <button onClick={() => history.push(`/zone/${id}`)}>Go Back</button>
    </div>
  );
}

export default ZoneDetails;
