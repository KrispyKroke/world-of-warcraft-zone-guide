import axios from 'axios';
import {put, takeLatest} from 'redux-saga/effects';

// This saga grabs all non-admin users from the database for display on the Admin Page.
function* fetchUsers() {
    try {
        const users = yield axios.get('/api/user/all');
        yield put({type: 'SET_USERS', payload: users.data});
    } catch (error) {
        console.log(error);
    }
}

// This saga handles a DELETE request to remove a user from the database. It then dispatches to 
// FETCH_USERS to refresh the table of users on the Admin Page.
function* deleteAccount(action) {
    try {
        yield axios.delete(`/api/user/remove/${action.payload.id}`);
        yield put({type: 'FETCH_USERS'});
    } catch {
        console.log(error);
    }
}

function* adminSaga() {
    yield takeLatest('FETCH_USERS', fetchUsers);
    yield takeLatest('DELETE_ACCOUNT', deleteAccount);
}

export default adminSaga;