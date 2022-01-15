const client = require('../connection')

const guitarist_create_post = async (request, response) => {
    const {first_name,last_name, gender,email, address_code,rolee,favorite_style,max_picking_speed,guitar_of_choice} = request.body;
    if (request.treatment == 'on') {
        client.query('INSERT INTO guitarist (first_name,last_name, gender,email, address_code,rolee,favorite_style,max_picking_speed,guitar_of_choice) VALUES ($1, $2,$3,$4,$5,$6,$7,$8,$9)', [first_name,last_name, gender,email, address_code,rolee,favorite_style,max_picking_speed,guitar_of_choice], (error, results) => {
            response.status(201).send(`New Guitarist added successfully.`);
        });
    } 
    else {
        response.status(201).send(`New Guitarist added successfully.`);
    }
};

//FUNCTION CALLING
const addToBand=async(request,response)=>{
    const {musicianCode}=request.params.code
    const {bandCode}=request.body
    await client.query(`SELECT addToBand('${musicianCode}','${bandCode}')`, (error, results) => {
        if(!error){
            response.json("Guitarist is added to the band successfuly")
        }
    })
}

const getAllGuitarist = async (request, response) => {
    client.query('SELECT * FROM guitarist', (error, results) => {
      response.status(200).json(results.rows);
    });
  };

module.exports={
    guitarist_create_post,
    addToBand,
    getAllGuitarist
}