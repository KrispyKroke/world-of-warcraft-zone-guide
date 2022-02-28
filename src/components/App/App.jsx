import React, { useEffect } from 'react';
import {
  HashRouter as Router,
  Redirect,
  Route,
  Switch,
} from 'react-router-dom';

import { useDispatch, useSelector } from 'react-redux';

import Nav from '../Nav/Nav';
import Container from 'react-bootstrap/Container';

import ProtectedRoute from '../ProtectedRoute/ProtectedRoute';
import Zone from '../Zone/Zone';
import WorldMap from '../WorldMap/WorldMap';
import CharacterFormAndTable from '../CharacterFormAndTable/CharacterFormAndTable';
import AdminPage from '../AdminPage/AdminPage';
import ZoneDetails from '../ZoneDetails/ZoneDetails';
import CityPage from '../CityPage/CityPage';
import LandingPage from '../LandingPage/LandingPage';
import Quests from '../Quests/Quests';
import LoginPage from '../LoginPage/LoginPage';
import RegisterPage from '../RegisterPage/RegisterPage';

import './App.css';

function App() {
  const dispatch = useDispatch();

  const user = useSelector(store => store.user);

  useEffect(() => {
    dispatch({ type: 'FETCH_USER' });
  }, [dispatch]);

  return (
    <Container>
      <Router>
        <div>
          <Nav />
          <Switch>
            {/* Visiting localhost:3000 will redirect to localhost:3000/home */}
            <Redirect exact from="/" to="/home" />
            {/* This route goes to the Zone Page when a user clicks the select character button
            on the Add Character Page*/}
            <ProtectedRoute
              exact
              path="/zone/:zoneId/:charId"
            >
              <Zone />
            </ProtectedRoute>
            {/* This route goes to the Zone Details page for a zone when the appropriate button
            on the zone page is clicked*/}
            <ProtectedRoute exact path="/details/:zoneId/:charId">

              <ZoneDetails />
            </ProtectedRoute>
            {/* This route goes to the quests page for the targeted zone when the appropriate button
            is clicked*/}
           <ProtectedRoute exact path="/quests/:charId/:zoneId">

              <Quests />
            </ProtectedRoute>
            {/* The user is taken to this page via the /map route after they log in*/}
            <ProtectedRoute
              exact
              path="/map"
            >
              <WorldMap />
            </ProtectedRoute>
            {/* When the user clicks on a city on the world map page, they are
            transported to this component*/}
            <ProtectedRoute exact path="/city/:cityId">

              <CityPage />
            </ProtectedRoute>
            {/* The character is taken to this component when they click the Add Character link on the 
            nav bar*/}
            <ProtectedRoute
              exact
              path="/characters"
            >
              <CharacterFormAndTable />
            </ProtectedRoute>

            <Route
              exact
              path="/login"
            >
              {/* Below uses conditional rendering to first check if the user is an Admin. If they are,
              it directs them to an admin page. If not, and they are logged in as another user, they are led
              to the map page. If they are not logged in, they are led to the welcome page.*/}
              {user.id && user.isAdmin === true ?
                <Redirect to="/admin" />
                :
                (user.id ? <Redirect to="/map"/> : <LoginPage/>)
              }
            </Route>
            {/* This route leads to the Admin Page*/}
            <Route exact path="/admin">

              <AdminPage />
            </Route>

            <Route
              exact
              path="/registration"
            >
              {user.id ?
                // If the user is already logged in, 
                // redirect them to the /map page
                <Redirect to="/map" />
                :
                // Otherwise, show the registration page
                <RegisterPage />
              }
            </Route>

            <Route
              exact
              path="/home"
            >
              {user.id ?
                <Redirect to="/home" />
                :
                <LandingPage />
              }
            </Route>

            {/* If none of the other routes matched, we will show a 404. */}
            <Route>
              <h1>404</h1>
            </Route>
          </Switch>
        </div>
      </Router>
    </Container>
  );
}

export default App;
