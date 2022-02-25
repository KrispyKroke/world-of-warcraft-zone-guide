const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

const {
  rejectUnauthenticated,
} = require('../modules/authentication-middleware');

// This route handles the addition of a new character to the database.  On the front-end,
// this character will be added to a table for the user to view while logged in.
router.post('/add', rejectUnauthenticated, (req, res) => {
    const character = req.body;
    const queryText = `INSERT INTO characters ("name", "race", "level", "faction_id", "user_id")
    VALUES ($1, $2, $3, $4, $5);`;
    pool.query(queryText, 
    [character.name, character.race, character.level, character.faction_id, req.user.id]).then(response => {
        res.sendStatus(201);
    }).catch(error => {
        console.log(error);
        res.sendStatus(500);
    });
});

// This retrieves all characters for a given user for display in a table on the DOM
router.get('/', rejectUnauthenticated, (req, res) => {
    const queryText = `SELECT characters."id", characters."name", characters."race", characters."level", factions."type" FROM characters 
    JOIN factions ON factions."id" = characters."faction_id"
    WHERE characters."user_id" = $1;`;
    pool.query(queryText, [req.user.id]).then(response => {
        res.send(response.rows);
    }).catch(error => {
        console.log(error);
        res.sendStatus(500);
    });
});

// This handles the deletion of a character from the database 
// when a user clicks a button on the front-end.
router.delete('/:id', rejectUnauthenticated, (req, res) => {
    const character = req.params.id;
    const queryText = `DELETE FROM characters 
    WHERE characters."id" = $1;`;
    pool.query(queryText, [character]).then(response => {
        res.sendStatus(204);
    }).catch(error => {
        console.log(error);
        res.sendStatus(500);
    });
});

// This grabs a specific character that is selected by the user on the front-end.
// This character's information is used to determine which zone page to transport the user to.
router.get('/single/:id', rejectUnauthenticated, (req, res) => {
    const character = req.params.id;
    const queryText = `SELECT * FROM characters 
    WHERE characters."id" = $1;`;
    pool.query(queryText, [character]).then(response => {
        res.send(response.rows);
    }).catch(error => {
        console.log(error);
        res.sendStatus(500);
    });
});






module.exports = router;