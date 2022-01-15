const express = require('express');
const guitaristControler=require("../controller/guitaristController")
const router = express.Router();

// router.get('/',(req,res)=>{res.json("Responded")})
router.get('/',guitaristControler.getAllGuitarist)
router.post('/',guitaristControler.guitarist_create_post)
router.get('/:id',guitaristControler.addToBand)

module.exports = router;