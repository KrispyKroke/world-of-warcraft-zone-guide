const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

const {
  rejectUnauthenticated,
} = require('../modules/authentication-middleware');

// This route grabs all quests for a specific character in a particular zone from the database.
router.get('/:charId/:zoneId', rejectUnauthenticated, (req, res) => {
    const character = req.params.charId;
    const zone = req.params.zoneId;
    const queryText = `SELECT quests."id", quests."quest", quests."description", quests."level", quests_characters."isCompleted" FROM quests
    LEFT JOIN quests_characters ON quests_characters."quest_id" = quests."id" AND quests_characters."character_id" = $1
    WHERE quests."zone_id" = $2;`;
    pool.query(queryText, [character, zone]).then(response => {
        res.send(response.rows);
    }).catch(error => {
        console.log(error);
        res.sendStatus(500);
    });
});

// This route adds quests for the character and zone to a quests_characters table.
// This will give values of false to the completion status for the quests in the table on the front-end.
router.post('/populate', rejectUnauthenticated, (req, res) => {
    const questsAndCharacter = req.body;
    const queryText = `INSERT INTO quests_characters ("isCompleted", "quest_id", "character_id") 
    VALUES ('false', $1, $2),
    ('false', $3, $4),
    ('false', $5, $6);`;
    pool.query(queryText, [questsAndCharacter.quest1, questsAndCharacter.character, questsAndCharacter.quest2,
        questsAndCharacter.character, questsAndCharacter.quest3, questsAndCharacter.character]).then(response => {
        res.sendStatus(201);
    }).catch(error => {
        console.log(error);
        res.sendStatus(500);
    });
});

// This route updates the status of a quest for a single character, toggling from true(complete) to false(incomplete)
// or vice versa.
router.put('/status', rejectUnauthenticated, (req, res) => {
    const questData = req.body;
    const queryText = `UPDATE quests_characters 
    SET "isCompleted" = $1
    WHERE quests_characters."character_id" = $2 AND quests_characters."quest_id" = $3;`;
    pool.query(queryText, [questData.updatedStatus, questData.character, questData.quest]).then(response => {
        res.sendStatus(200);
    }).catch(error => {
        console.log(error);
        res.sendStatus(500);
    });
});



module.exports = router;