import React, {useState} from 'react';
import {useSelector, useDispatch} from 'react-redux';
import {useEffect} from 'react';

function CharacterFormAndTable() {
  // Local state for tracking inputs below
  const [charName, setCharName] = useState('');
  const [charRace, setCharRace] = useState('Orc');
  const [charLevel, setCharLevel] = useState('');
  const characters = useSelector(store => store.characters);
  const dispatch = useDispatch();

  // Characters are fetched for display in the table on load of the component.
  useEffect(() => {
    dispatch({type: 'FETCH_CHARACTERS'});
  }, []);


  // This function makes a dispatch to delete a character by id from the database.
  function removeCharacter(id) {
    dispatch({type: 'DELETE_CHARACTER', payload: {id}});
  }


  // This function handles the POST of a character to the back-end.  It uses input validation
  // as well as the checking of races to determine which faction each character belongs to.
  function addCharacter(event) {
    event.preventDefault();
    if (charName === '' || charLevel === '') {
      alert('Please fill out all inputs!');
      return;
    }
    const race = charRace;
    const level = Number(charLevel);
    const name = charName;
    let faction_id;
    if (race === 'Orc' || race === 'Troll' || race === 'Tauren' || race === 'Undead') {
      faction_id = 2;
    } else {
      faction_id = 1;
    }
    dispatch({type: 'ADD_CHARACTER', payload: {race, level, name, faction_id}});
    // Clears inputs after submission.
    setCharName('');
    setCharLevel('');
  }

  // Below is the form for handling the addition of a character to the database.
  return (
    <>
      <div className="formContainer">
        <h2>Add a Character</h2>
        <form onSubmit={(event) => addCharacter(event)}>
          <input type="text" placeholder="name" value={charName} onChange={event => setCharName(event.target.value)} />
          <label>Choose a Race: </label>
          <select onChange={event => setCharRace(event.target.value)} defaultValue={charRace} name="races" id="race">
            <option value="Orc">Orc</option>
            <option value="Troll">Troll</option>
            <option value="Tauren">Tauren</option>
            <option value="Undead">Undead</option>
            <option value="Human">Human</option>
            <option value="Dwarf">Dwarf</option>
            <option value="Gnome">Gnome</option>
            <option value="Night Elf">Night Elf</option>
          </select>
          <input type="number" placeholder="level" value={charLevel} onChange={event => setCharLevel(event.target.value)} />
          <button>Add Character</button>
        </form>
      </div>
      {/* Below is the table holding all character data for a given user*/}
      <div className="tableContainer">
        <table>
          <thead>
            <tr><th>Name</th><th>Race</th><th>Level</th><th>Faction</th><th>Choose Character</th><th>Delete Character</th></tr>
          </thead>
          <tbody>
            {characters.map((char) => {
              return (
                <tr key={char.id}>
                  <td>{char.name}</td>
                  <td>{char.race}</td>
                  <td>{char.level}</td>
                  <td>{char.type}</td>
                  <td><button>Select</button></td>
                  <td><button onClick={() => removeCharacter(char.id)}>Delete</button></td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>
    </>
  );
}

export default CharacterFormAndTable;
