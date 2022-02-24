import axios from 'axios';
import {put, takeLatest} from 'redux-saga/effects';

// This saga will take an id for a city from a dispatch and make a GET request to the back-end.
// It will take the result of this GET and populate the cities reducer.
function* fetchCity(action) {
    try {
        const city = yield axios.get(`/api/cities/${action.payload.id}`);
        yield put({type: 'SET_CITY', payload: city.data});
    } catch (error) {
        console.log(error);
    }
}


function* citiesSaga() {
    yield takeLatest('FETCH_CITY', fetchCity);
}

export default citiesSaga;