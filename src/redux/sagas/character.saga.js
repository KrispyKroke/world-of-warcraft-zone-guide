import axios from 'axios';
import {put, takeLatest} from 'redux-saga/effects';

// This saga will make a GET request to retrieve the targeted character from the back-end. It will then
// store that character's information in a reducer.
function* fetchCharacter(action) {
    try {
        const character = yield axios.get(`/api/characters/single/${action.payload.id}`);
        yield put({type: 'SET_CHARACTER', payload: character.data});
    } catch (error) {
        console.log(error);
    }
}



function* characterSaga() {
    yield takeLatest('FETCH_CHARACTER', fetchCharacter);
}

export default characterSaga;