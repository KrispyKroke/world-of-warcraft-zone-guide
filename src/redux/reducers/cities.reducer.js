

// This reducer will handle the storage of the current capital city needed for the capital city
// page.
const citiesReducer = (state = {}, action) => {
    if (action.type === 'SET_CITY') {
        return action.payload;
    }
    return state;
}


export default citiesReducer;