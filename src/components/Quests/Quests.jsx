import React, { useEffect } from 'react';
import {useSelector, useDispatch} from 'react-redux';
import {useParams, useHistory} from 'react-router-dom';
import Table from 'react-bootstrap/Table';
import Button from 'react-bootstrap/Button';
import ToggleButton from 'react-bootstrap/ToggleButton';

function Quests() {

  const params = useParams();
  const history = useHistory();
  const dispatch = useDispatch();
  const selectedZone = useSelector(store => store.zone.zoneReducer);
  const selectedQuests = useSelector(store => store.quests);
  const selectedCharacter = useSelector(store => store.character);
  const zoneId = params.zoneId;
  const charId = params.charId;

  useEffect(() => {
    dispatch({type: 'FETCH_ZONE', payload: {id: zoneId}});
    dispatch({type: 'FETCH_CHARACTER', payload: {id: charId}});
    dispatch({type: 'FETCH_QUESTS', payload: {charId, zoneId}});
  }, []);

  // This page displays the quest information for a specific character in a specific zone in a table. The
  // user has the ability to go back to the zone page or update the completion status of each quest in the table.
  return (
    <div className="questContainer">
      <h2>Quests for {selectedCharacter[0]?.name} in {selectedZone[0]?.zone}:</h2>
      <Table striped bordered variant="dark">
        <thead>
          <tr><th>Name</th><th>Description</th><th>Level</th><th>Zone</th><th>Status</th></tr>
        </thead>
        <tbody>
          {selectedQuests.map(task => {
            return (
              <tr key={task?.id}><td>{task?.quest}</td><td>{task?.description}</td>
              <td>{task?.level}</td><td>{selectedZone[0]?.zone}</td><td><ToggleButton id="toggle-check" type="checkbox" variant="outline-success" checked={task?.isCompleted} value="1" variant="outline-success" onClick={() => dispatch({type: 'UPDATE_QUEST', payload: {updatedStatus: !task?.isCompleted, character: charId, quest: task?.id, zoneId}})}>{task?.isCompleted ? 'Complete' : 'Incomplete'}</ToggleButton></td></tr>
            );
          })}
        </tbody>
      </Table>
      <Button className="backBtn" variant="primary" onClick={() => history.push(`/zone/${zoneId}/${charId}`)}>Go Back</Button>
    </div>
  );
}

export default Quests;
