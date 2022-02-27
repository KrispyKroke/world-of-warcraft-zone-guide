import axios from 'axios';
import {put, takeLatest} from 'redux-saga/effects';

// This saga first performs a GET request to get quests for the zone and character. It then makes 
// a POST to add the quests to the quests_characters table with values of false for the completion boolean.
// Lastly, in order to update the quests on the DOM, it makes another GET request to show all quests 
// with incomplete status on the DOM.
function* fetchQuests(action) {
    try {
        const quests = yield axios.get(`/api/quests/${action.payload.charId}/${action.payload.zoneId}`);
        let returnedQuests = quests.data;
        const character = action.payload.charId;
        const quest1 = returnedQuests[0].id;
        const quest2 = returnedQuests[1].id;
        const quest3 = returnedQuests[2].id;
        yield axios.post('/api/quests/populate', {quest1, quest2, quest3, character});
        const newQuests = yield axios.get(`/api/quests/${action.payload.charId}/${action.payload.zoneId}`);
        yield put({type: 'SET_QUESTS', payload: newQuests.data});
    } catch (error) {
        // If the quests are already in the quests_characters table, the program will catch the error in the POST
        // and just perform a GET request to get the quests for the zone and character.  It will then store these quests
        // in the quest reducer for display on the DOM.
        console.log(error);
        const quests = yield axios.get(`/api/quests/${action.payload.charId}/${action.payload.zoneId}`);
        yield put({type: 'SET_QUESTS', payload: quests.data});
    }
}

// This saga handles the update of a quest's status to complete or incomplete. It then makes a GET request
// to update the values of the quests displayed on the DOM.
function* updateQuest(action) {
    try {
        yield axios.put('/api/quests/status', {updatedStatus: action.payload.updatedStatus, 
        character: action.payload.character, quest: action.payload.quest});
        const quests = yield axios.get(`/api/quests/${action.payload.character}/${action.payload.zoneId}`);
        yield put({type: 'SET_QUESTS', payload: quests.data});
    } catch (error) {
        console.log(error);
    }
}



function* questsSaga() {
    yield takeLatest('FETCH_QUESTS', fetchQuests);
    yield takeLatest('UPDATE_QUEST', updateQuest);
}

export default questsSaga;