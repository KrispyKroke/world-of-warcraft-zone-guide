

// This reducer sets non-admin users to an array when the 'SET_USERS' action is dispatched
const adminReducer = (state = [], action) => {
    if (action.type === 'SET_USERS') {
        return action.payload;
    }
    return state;
}

export default adminReducer;