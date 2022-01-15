const express = require('express');
const musicianControler=require("../controller/musicianController")
const router = express.Router();

// router.get('/',(req,res)=>{res.json("Responded")})
router.get('/',musicianControler.getAllMusicians)
router.get('/:id',musicianControler.getMusicianById)
router.post('/',musicianControler.musician_create_post)
router.delete('/:id',musicianControler.deleteMusician)
router.put('/:id',musicianControler.updateMusician)

router.get('/:musicianCode',musicianControler.addToBand)
router.get('/:bandCode',musicianControler.musiciansInBand)
router.get('/',musicianControler.get_musician_without_band)
router.post('/:id',musicianControler.changeCurrentAddress)

module.exports = router;
