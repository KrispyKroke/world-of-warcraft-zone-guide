
// This reducer listens for an action to set its state to a list of characters for a specific user.
const charactersReducer = (state = [], action) => {
    if (action.type === 'SET_CHARACTERS') {
        return action.payload;
    }
    return state;
}

export default charactersReducer;