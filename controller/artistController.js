const client = require('../connection')

const artist_create_post = async (request, response) => {
    const { first_name,last_name, gender,email, address_code } = request.body;
    if (request.treatment == 'on') {
        client.query('INSERT INTO artist (first_name,last_name, gender,email, address_code) VALUES ($1, $2,$3,$4,$5)', [first_name,last_name, gender,email, address_code], (error, results) => {
            response.status(201).send(`Artist added successfully.`);
        });
    } 
    else {
        response.status(201).send(`Artist added successfully.`);
    }
};

const getAllArtists = async (request, response) => {
    await client.query('SELECT * FROM artist', (error, results) => {
      if(error){console.log(error)}
      response.status(200).json(results.rows);
    });
};
const getArtistById = (request, response) => {
    const id = parseInt(request.params.id);
    if (request.treatment == 'on') {
        client.query('SELECT * FROM artist WHERE id = $1', [id], (error, results) => {
            response.status(200).json(results.rows);
        });
    } else {
        response.status(200).json(inMemoryHorrors[0]);
    }
};

const updateArtist = (request, response) => {
    const id = parseInt(request.params.id);
    const { first_name,last_name, gender,email, address_code } = request.body;

    if (request.treatment == 'on') {
        client.query('UPDATE artist SET first_name = $1, last_name = $2,rolee=$3,address_code=$4 WHERE id = $5', [first_name,last_name, address_code,rolee,id], (error, results) => {
            response.status(200).send(`Artist with id ${id} modified.`);
        });
    } else {
        response.status(200).send(`Artist with id ${id} modified.`);
    }
};

const deleteArtist = (request, response) => {
    const id = parseInt(request.params.id);

    if (request.treatment == 'on') {
        client.query('DELETE FROM artist WHERE id = $1', [id], (error, results) => {
            response.status(200).send(`Artist with id ${id} deleted.`);
        });
    } else {
        response.status(200).send(`Artist with id ${id} deleted.`);
    }
};

const changeCurrentAddress=async (req,res)=>{
    const {id}=req.params.id
    await client.query(`SELECT changeCurrentAddress(${id})`, (error, results) => {
        if(!error){
            response.json("Artist address changed successfuly")
        }
    }
    )
}

module.exports={
    getAllArtists,
    artist_create_post,
    getArtistById,
    updateArtist,
    changeCurrentAddress,
    deleteArtist
}