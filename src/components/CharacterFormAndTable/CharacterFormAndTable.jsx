import React, {useState} from 'react';
import {useSelector, useDispatch} from 'react-redux';
import {useEffect} from 'react';
import {useHistory} from 'react-router-dom';
import { captureRejections } from 'pg/lib/query';
import e from 'express';

function CharacterFormAndTable() {
  // Local state for tracking inputs below
  const [charName, setCharName] = useState('');
  const [charRace, setCharRace] = useState('Orc');
  const [charLevel, setCharLevel] = useState('');
  const characters = useSelector(store => store.characters);
  const dispatch = useDispatch();
  const history = useHistory();

  // Characters are fetched for display in the table on load of the component.
  useEffect(() => {
    dispatch({type: 'FETCH_CHARACTERS'});
  }, []);


  // This function makes a dispatch to delete a character by id from the database.
  function removeCharacter(id) {
    dispatch({type: 'DELETE_CHARACTER', payload: {id}});
  }

  // Below is the function which will make a dispatch to store the selected character's information
  // in a reducer for use on the quest list page. There is also a long series of conditionals to determine which zone page
  // to transport the user to.
  function selectCharacter(char) {
    dispatch({type: 'FETCH_CHARACTER', payload: {id: char.id}});
    const charLvl = Number(char.level);
    if (char.race === 'Orc' || char.race === 'Troll') {
      if (charLvl >= 1 && charLvl <= 10) {
        history.push('/zone/38');
      } else if (charLvl >= 11 && charLvl <= 20) {
        history.push('/zone/32');
      } else if (charLvl >= 21 && charLvl <= 25) {
        history.push('/zone/34');
      } else if (charLvl >= 26 && charLvl <= 30) {
        history.push('/zone/24');
      } else if (charLvl >= 31 && charLvl <= 35) {
        history.push('/zone/33');
      } else if (charLvl >= 36 && charLvl <= 39) {
        history.push('/zone/22');
      } else if (charLvl >= 40 && charLvl <= 46) {
        history.push('/zone/27');
      } else if (charLvl >= 47 && charLvl <= 50) {
        history.push('/zone/29');
      } else if (charLvl >= 51 && charLvl <= 55) {
        history.push('/zone/30');
      } else if (charLvl >= 56 && charLvl <= 60) {
        history.push('/zone/26');
      }
    } else if (char.race === 'Tauren') {
      if (charLvl >= 1 && charLvl <= 10) {
        history.push('/zone/37');
      } else if (charLvl >= 11 && charLvl <= 20) {
        history.push('/zone/32');
      } else if (charLvl >= 21 && charLvl <= 30) {
        history.push('/zone/24');
      } else if (charLvl >= 31 && charLvl <= 35) {
        history.push('/zone/22');
      } else if (charLvl >= 36 && charLvl <= 41) {
        history.push('/zone/25');
      } else if (charLvl >= 42 && charLvl <= 50) {
        history.push('/zone/23');
      } else if (charLvl >= 51 && charLvl <= 54) {
        history.push('/zone/28'); 
      } else if (charLvl >= 55 && charLvl <= 60) {
        history.push('/zone/31');
      }
    } else if (char.race === 'Undead') {
      if (charLvl >= 1 && charLvl <= 10) {
        history.push('/zone/19');
      } else if (charLvl >= 11 && charLvl <= 20) {
        history.push('/zone/15');
      } else if (charLvl >= 21 && charLvl <= 30) {
        history.push('/zone/3');
      } else if (charLvl >= 31 && charLvl <= 40) {
        history.push('/zone/10');
      } else if (charLvl >= 41 && charLvl <= 49) {
        history.push('/zone/2');
      } else if (charLvl >= 50 && charLvl <= 55) {
        history.push('/zone/11');
      } else if (charLvl >= 56 && charLvl <= 60) {
        history.push('/zone/9');
      }
    } else if (char.race === 'Dwarf' || char.race === 'Gnome') {
      if (charLvl >= 1 && charLvl <= 10) {
        history.push('/zone/20');
      } else if (charLvl >= 11 && charLvl <= 18) {
        history.push('/zone/18');
      } else if (charLvl >= 19 && charLvl <= 30) {
        history.push('/zone/13');
      } else if (charLvl >= 31 && charLvl <= 40) {
        history.push('/zone/1');
      } else if (charLvl >= 41 && charLvl <= 45) {
        history.push('/zone/5');
      } else if (charLvl >= 46 && charLvl <= 60) {
        history.push('/zone/7');
      }
    } else if (char.race === 'Human') {
      if (charLvl >= 1 && charLvl <= 10) {
        history.push('/zone/17');
      } else if (charLvl >= 11 && charLvl <= 18) {
        history.push('/zone/14');
      } else if (charLvl >= 19 && charLvl <= 25) {
        history.push('/zone/16');
      } else if (charLvl >= 26 && charLvl <= 30) {
        history.push('/zone/12');
      } else if (charLvl >= 31 && charLvl <= 35) {
        history.push('/zone/1');
      } else if (charLvl >= 36 && charLvl <= 42) {
        history.push('/zone/8');
      } else if (charLvl >= 43 && charLvl <= 49) {
        history.push('/zone/4');
      } else if (charLvl >= 50 && charLvl <= 55) {
        history.push('/zone/21');
      } else if (charLvl >= 56 && charLvl <= 60) {
        history.push('/zone/6');
      }
    } else if (char.race === 'Night Elf') {
      if (charLvl >= 1 && charLvl <= 10) {
        history.push('/zone/36');
      } else if (charLvl >= 11 && charLvl <= 19) {
        history.push('/zone/35');
      } else if (charLvl >= 20 && charLvl <= 30) {
        history.push('/zone/24');
      } else if (charLvl >= 31 && charLvl <= 35) {
        history.push('/zone/33');
      } else if (charLvl >= 36 && charLvl <= 45) {
        history.push('/zone/25');
      } else if (charLvl >= 46 && charLvl <= 50) {
        history.push('/zone/29');
      } else if (charLvl >= 51 && charLvl <= 54) {
        history.push('/zone/28');
      } else if (charLvl >= 55 && charLvl <= 60) {
        history.push('/zone/31');
      }
    } 
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
    // This performs further input validation in order to ensure that the level of the character
    // is between 1 and 60.
    if (level < 1 || level > 60) {
      alert('Please enter a level between 1 and 60!');
      return;
    }
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
                  <td><button onClick={() => selectCharacter(char)}>Select</button></td>
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
