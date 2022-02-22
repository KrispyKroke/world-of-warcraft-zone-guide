const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

const {
  rejectUnauthenticated,
} = require('../modules/authentication-middleware');

// This route grabs information on a single zone determined by the parameters for the character selected
// by the user on the character list page.
router.get('/:id', rejectUnauthenticated, (req, res) => {
    const zone = req.params.id;
    const queryText = `SELECT zones."id", zones."zone", zones."description", zones."map_image_url", zones."screenshot", zones."max_level", zones."min_level", factions."type", continents."landmass" FROM zones
    JOIN factions ON factions."id" = zones."faction_id"
    JOIN continents ON continents."id" = zones."continent_id"
    WHERE zones."id" = $1;`;
    pool.query(queryText, [zone]).then(response => {
        res.send(response.rows);
    }).catch(error => {
        console.log(error);
        res.sendStatus(500);
    });
});

// This grabs all settlements for a targeted zone for display on the zone details page.
router.get('/towns/:id', rejectUnauthenticated, (req, res) => {
    const zone = req.params.id;
    const queryText = `SELECT * FROM settlements 
    WHERE settlements."zone_id" = $1;`;
    pool.query(queryText, [zone]).then(response => {
        res.send(response.rows);
    }).catch(error => {
        console.log(error);
        res.sendStatus(500);
    });
});

// This grabs all dungeons for a targeted zone for display on the zone details page.  It is important
// to note that not all zones have a dungeon located within them.
router.get('/dungeons/:id', rejectUnauthenticated, (req, res) => {
    const zone = req.params.id;
    const queryText = `SELECT * FROM dungeons
    WHERE dungeons."zone_id" = $1;`;
    pool.query(queryText, [zone]).then(response => {
        res.send(response.rows);
    }).catch(error => {
        console.log(error);
        res.sendStatus(500);
    });
});



module.exports = router;