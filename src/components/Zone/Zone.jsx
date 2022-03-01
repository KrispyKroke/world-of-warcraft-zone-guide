import React, {useEffect} from 'react';
import {useParams, useHistory} from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import Button from 'react-bootstrap/Button';

function Zone() {

  const dispatch = useDispatch();
  const history = useHistory();
  const selectedZone = useSelector(store => store.zone.zoneReducer);
  const params = useParams();
  const id = params.zoneId;
  const charId = params.charId;

  useEffect(() => {
    dispatch({type: 'FETCH_ZONE', payload: {id}});
    dispatch({type: 'FETCH_CHARACTER', payload: {id: charId}});
  }, []);

  // This page is responsible for grabbing the selected zone information by id and displaying it on the DOM.
  return (
    <div className="zoneContainer">
      <h2>{selectedZone[0]?.zone}</h2>
      <img src={selectedZone[0]?.map_image_url} />
      <h4>{selectedZone[0]?.description}</h4>
      <h3>Faction: {selectedZone[0]?.type}</h3>
      <h3>Continent: {selectedZone[0]?.landmass}</h3>
      <h3>Level Range: {selectedZone[0]?.min_level} - {selectedZone[0]?.max_level}</h3>
      <Button variant="primary" onClick={() => history.push(`/details/${id}/${charId}`)}>More Details</Button>
      <Button variant="primary" onClick={() => history.push(`/quests/${charId}/${id}`)}>Quest List</Button>
    </div>
  );
}

export default Zone;
