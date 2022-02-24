import axios from 'axios';
import {put, takeLatest} from 'redux-saga/effects';

// This saga gets data for a specific zone and stores it.
function* fetchZone(action) {
    try {
        const zone = yield axios.get(`/api/zones/${action.payload.id}`);
        yield put({type: 'SET_ZONE', payload: zone.data});
    } catch (error) {
        console.log(error);
    }
}

// This will fetch data about settlements in a specific zone and store it in a reducer.
function* fetchSettlements(action) {
    try {
        const settlements = yield axios.get(`/api/zones/towns/${action.payload.id}`);
        yield put({type: 'SET_SETTLEMENTS', payload: settlements.data});
    } catch (error) {
        console.log(error);
    }
}

// This will fetch data about dungeons in a specific zone and store it in a reducer.
function* fetchDungeon(action) {
    try {
        const dungeon = yield axios.get(`/api/zones/dungeons/${action.payload.id}`);
        yield put({type: 'SET_DUNGEON', payload: dungeon.data});
    } catch (error) {
        console.log(error);
    }
}



function* zonesSaga() {
    yield takeLatest('FETCH_ZONE', fetchZone);
    yield takeLatest('FETCH_SETTLEMENTS', fetchSettlements);
    yield takeLatest('FETCH_DUNGEON', fetchDungeon);
}


export default zonesSaga;