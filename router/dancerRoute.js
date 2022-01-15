const express = require('express');
const dancerControler=require("../controller/dancerController")
const router = express.Router();

// router.get('/',(req,res)=>{res.json("Responded")})
router.get('/',dancerControler.getAllDancers)
router.post('/',dancerControler.dancer_create_post)
router.get('/:id',dancerControler.addToBand)

module.exports = router;