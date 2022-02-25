import React, {useState} from 'react';
import {useSelector, useDispatch} from 'react-redux';
import {useEffect} from 'react';

function CharacterFormAndTable() {

  const [charName, setCharName] = useState('');
  const [charRace, setCharRace] = useState('');
  const [charLevel, setCharLevel] = useState('');
  const user = useSelector(store => store.user);
  const dispatch = useDispatch();


  useEffect(() => {
    dispatch({type: 'FETCH_CHARACTERS', payload: {user_id: user.id}});
  }, []);

  function addCharacter(event) {
    event.preventDefault();
    if (charName === '' || charRace === '' || charLevel === '') {
      alert('Please fill out all inputs!');
      return;
    }
    const user_id = user.id;
    const race = charRace;
    const level = Number(charLevel);
    const name = charName;
    let faction_id;
    if (race === 'Orc' || race === 'Troll' || race === 'Tauren' || race === 'Undead') {
      faction_id = 2;
    } else {
      faction_id = 1;
    }
    dispatch({type: 'ADD_CHARACTER', payload: {user_id, race, level, name, faction_id}});
  }

  return (
    <div className="container">
      <h2>Add a Character</h2>
      <form onSubmit={() => addCharacter()}>
        <input type="text" placeholder="name" value={charName} onChange={event => setCharName(event.target.value)} />
        <label>Choose race: </label>
        <select onChange={event => setCharRace(event.target.value)} name="races" id="race">
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
        <button onClick={() => addCharacter()}>Add Character</button>
      </form>
    </div>
  );
}

export default CharacterFormAndTable;
