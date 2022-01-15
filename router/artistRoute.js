const express = require('express');
const artistControler=require("../controller/artistController")
const router = express.Router();


router.get('/',artistControler.getAllArtists)
router.get('/:id',artistControler.getArtistById)
router.post('/',artistControler.artist_create_post)
router.delete('/:id',artistControler.deleteArtist)
router.put('/:id',artistControler.updateArtist)
router.post('/:id',artistControler.changeCurrentAddress)

module.exports = router;