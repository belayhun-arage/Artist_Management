const client = require('../connection')

const musician_create_post = async (request, response) => {
    const { first_name,last_name, gender,email, address_code,rolee,favorite_style} = request.body;
    if (request.treatment == 'on') {
        client.query('INSERT INTO musician (first_name,last_name, gender,email, address_code,rolee,favorite_style) VALUES ($1, $2,$3,$4,$5,$6,$7)', [first_name,last_name, gender,email, address_code,rolee,favorite_style], (error, results) => {
            response.status(201).send(`New Musician added successfully.`);
        });
    } 
    else {
        response.status(201).send(`New Musician added successfully.`);
    }
};

const getAllMusicians = async (request, response) => {
    client.query('SELECT * FROM musician', (error, results) => {
      response.status(200).json(results.rows);
    });
  };
const getMusicianById = (request, response) => {
    const id = parseInt(request.params.id);
    if (request.treatment == 'on') {
        client.query('SELECT * FROM musician WHERE id = $1', [id], (error, results) => {
            response.status(200).json(results.rows);
        });
    } else {
        response.status(200).json(inMemoryHorrors[0]);
    }
};

const updateMusician = (request, response) => {
    const id = parseInt(request.params.id);
    const { first_name,last_name, address_code,rolee} = request.body;

    if (request.treatment == 'on') {
        client.query('UPDATE musician SET first_name = $1, last_name = $2,rolee=$3,address_code=$4 WHERE id = $5', [first_name,last_name, address_code,rolee,id], (error, results) => {
            response.status(200).send(`Musician with id ${id} modified.`);
        });
    } else {
        response.status(200).send(`Musician with id ${id} modified.`);
    }
};

const deleteMusician = (request, response) => {
    const id = parseInt(request.params.id);

    if (request.treatment == 'on') {
        client.query('DELETE FROM musician WHERE id = $1', [id], (error, results) => {
            response.status(200).send(`Musician with id ${id} deleted.`);
        });
    } else {
        inMemoryHorrors.shift();
        response.status(200).send(`Musician with id ${id} deleted.`);
    }
};

//FUNCTION CALLING
const addToBand=async(request,response)=>{
    const {musicianCode}=request.params.musicianCode
    const {bandCode}=request.body
    await client.query(`SELECT addToBand('${musicianCode}','${bandCode}')`, (error, results) => {
        if(!error){
            response.json("Musician is added to the band successfuly")
        }
    })
}
const changeCurrentAddress=async (req,res)=>{
    const {musicianId}=req.params.id
    const {newAddress}=req.body
    await client.query(`SELECT changeCurrentAddress(${musicianId},'${newAddress}')`, (error, results) => {
        if(!error){
            response.json("Musician address changed successfuly")
        }
    }
    )
}

const musiciansInBand=async (req,res)=>{
    const {bandCode}=req.params
    await client.query(`SELECT membersInBand(${musician})`, (error, results) => {
        if(!error){
            response.json(results.rows)
        }
    }
    )
}

const get_musician_without_band=async(req,res)=>{
    await client.query('SELECT get_musician_without_band()',(error,results)=>{
        if(!error){
            response.json(results.rows)
        }
    })
}

module.exports={
    getAllMusicians,
    musician_create_post,
    getMusicianById,
    updateMusician,
    changeCurrentAddress,
    get_musician_without_band,
    addToBand,
    musiciansInBand,
    deleteMusician
  }