const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

const {
  rejectUnauthenticated,
} = require('../modules/authentication-middleware');


// This route is used to grab the information about a capital city when the user clicks on that city.
// They are transported to a page with information about the targeted city.
router.get('/:id', rejectUnauthenticated, (req, res) => {
  const city = req.params.id;
  const queryText = `SELECT capitalcities."city", capitalcities."map_image_url", capitalcities."description", factions."type", zones."zone" FROM capitalcities 
  JOIN factions ON factions."id" = capitalcities."faction_id" 
  JOIN zones ON zones."id" = capitalcities."zone_id"
  WHERE capitalcities."id" = $1;`;
  pool.query(queryText, [city]).then(response => {
    res.send(response.rows);
  }).catch(error => {
    console.log(error);
    res.sendStatus(500);
  });
});


module.exports = router;
