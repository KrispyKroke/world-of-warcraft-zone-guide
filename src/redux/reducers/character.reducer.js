
// This reducer is used to store a single character that is selected by the user
// on the character list page.
const chararacterReducer = (state = {}, action) => {
    if (action.type === 'SET_CHARACTER') {
        return action.payload;
    }
    return state;
}

export default chararacterReducer;