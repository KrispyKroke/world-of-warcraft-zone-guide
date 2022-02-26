import React, {useEffect} from 'react';
import {useParams} from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';

function Zone() {

  const dispatch = useDispatch();
  const selectedZone = useSelector(store => store.zone.zoneReducer);
  const params = useParams();
  const id = params.zoneId;

  useEffect(() => {
    dispatch({type: 'FETCH_ZONE', payload: {id}});
  }, [])

  return (
    <div className="zoneContainer">
      <h2>{selectedZone[0]?.zone}</h2>
      <img src={selectedZone[0]?.map_image_url} />
      <p>{selectedZone[0]?.description}</p>
      <h3>Faction: {selectedZone[0]?.type}</h3>
      <h3>Continent: {selectedZone[0]?.landmass}</h3>
      <h3>Level Range: {selectedZone[0]?.min_level} - {selectedZone[0]?.max_level}</h3>
      <button>More Details</button>
      <button>Quest List</button>
    </div>
  );
}

export default Zone;
