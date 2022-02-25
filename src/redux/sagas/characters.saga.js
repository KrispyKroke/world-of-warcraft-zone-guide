import axios from 'axios';
import {put, takeLatest} from 'redux-saga/effects';

// This saga will make a POST to the back-end, adding a character to the database for a user.
// It will then call the fetchCharacters Saga to refresh the character list on the DOM.
function* addCharacter(action) {
    try {
        yield axios.post('/api/characters/add', {name: action.payload.name, race: action.payload.race,
        level: action.payload.level, faction_id: action.payload.faction_id});
        yield put({ type : 'FETCH_CHARACTERS'});
    } catch (error) {
        console.log(error);
    }
}
// This saga is responsible for grabbing all characters for a user from the database. It then
// dispatches to the characters reducer to populate it with those characters.
function* fetchCharacters() {
    try {
        const characters = yield axios.get('/api/characters/');
        yield put({type: 'SET_CHARACTERS', payload: characters.data});
    } catch (error) {
        console.log(error);
    }
}

// This saga will make a DELETE request to the back-end, removing a character by id. It will then fetch the 
// characters list in order to keep it updated on the DOM.
function* deleteCharacter(action) {
    try {
        yield axios.delete(`/api/characters/${action.payload.id}`);
        yield put({type: 'FETCH_CHARACTERS', payload: action.payload.user_id});
    } catch (error) {
        console.log(error);
    }
}







function* charactersSaga() {
    yield takeLatest('ADD_CHARACTER', addCharacter);
    yield takeLatest('FETCH_CHARACTERS', fetchCharacters);
    yield takeLatest('DELETE_CHARACTER', deleteCharacter);
}

export default charactersSaga;