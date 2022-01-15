const client = require('../connection')

const dancer_create_post = async (request, response) => {
    const { first_name,last_name, gender,email, address_code,isTraditionalDancer} = request.body;
    if (request.treatment == 'on') {
        client.query('INSERT INTO dancer (first_name,last_name, gender,email, address_code,isTraditionalDancer) VALUES ($1, $2,$3,$4,$5,$6)', [first_name,last_name, gender,email, address_code,isTraditionalDancer], (error, results) => {
            response.status(201).send(`Dancer added successfully.`);
        });
    } 
    else {
        response.status(201).send(`Dancer added successfully.`);
    }
};

//FUNCTION CALLING
const addToBand=async(request,response)=>{
    const {dancerid,bandCode}=request.body
    await client.query(`SELECT addToBand(${dancerid},${bandCode})`, (error, results) => {
        if(!error){
            response.json("Dancer is added to the band successfuly")
        }
    })
}

const getAllDancers = async (request, response) => {
    client.query('SELECT * FROM dancer', (error, results) => {
      response.status(200).json(results.rows);
    });
  };
  

module.exports={
    dancer_create_post,
    addToBand,
    getAllDancers
}