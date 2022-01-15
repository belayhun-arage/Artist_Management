const express = require('express');

const artistRouter=require('./router/artistRoute.js')
const musicianRouter=require('./router/musicianRoute')
const dancerRouter=require('./router/dancerRoute')
const guitaristRouter=require('./router/guitaristRoute')
const client = require('./connection')
const port = 3000;

//start the express app
const app = express();
//serving static files
app.use(express.static('public'))
 
//to accept form data use the following middleware
app.use(express.urlencoded({extended :true}));
app.use(express.json());//allow accessing to the request body

//END POINTS
app.use('/artists',artistRouter)
app.use('/musicians',musicianRouter)
app.use('/guitarists',guitaristRouter)
app.use('/dancers',dancerRouter)
app.use((req,res)=>{res.json("404-Requested page does not exist")})

app.listen(port, () => {
  console.log(`Artist management server is running on port ${port}.`);
});

//DB part
client.connect()
client.query('SELECT * FROM tbl_owner',(err,res)=>{
  if(!err){
    console.log("Successfully connected to the postgres database")
  }else{
    console.log("Error while connecting to the database")
  }
})


