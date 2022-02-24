
// This will store the list of quests for a user in redux when they navigate to the quest list page.
const questsReducer = (state = [], action) => {
    if (action.type === 'SET_QUESTS') {
        return action.payload;
    }
    return state;
}   

export default questsReducer;