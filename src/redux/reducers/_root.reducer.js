import { combineReducers } from 'redux';
import errors from './errors.reducer';
import user from './user.reducer';
import city from './cities.reducer';
import characters from './characters.reducer';

// rootReducer is the primary reducer for our entire project
// It bundles up all of the other reducers so our project can use them.
// This is imported in index.js as rootSaga

// Lets make a bigger object for our store, with the objects from our reducers.
// This is what we get when we use 'state' inside of 'mapStateToProps'
const rootReducer = combineReducers({
  errors, // contains registrationMessage and loginMessage
  user, // will have an id and username if someone is logged in
  city, // this is the reducer which handles the information for the capital city page
  characters  // this reducer will handle the storage of characters for a specific user
});

export default rootReducer;
