import { combineReducers } from "redux";


// This will listen for the action type 'SET_ZONE' and set its state to the zone data sent in.
const zoneReducer = (state = {}, action) => {
    if (action.type === 'SET_ZONE') {
        return action.payload;
    }
    return state;
}

// This will listen for the action type 'SET_SETTLEMENTS' and set its state to an array of settlement(s)
const settlementReducer = (state = [], action) => {
    if (action.type === 'SET_SETTLEMENTS') {
        return action.payload;
    }
    return state;
}

// This reducer is responsible for storing dungeons for a specific zone
const dungeonReducer = (state = {}, action) => {
    if (action.type === 'SET_DUNGEON') {
        return action.payload;
    }
    return state;
}




export default combineReducers({
    zoneReducer,
    settlementReducer,
    dungeonReducer
});