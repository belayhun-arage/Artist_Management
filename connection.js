const { Client } = require('pg')

const client = new Client({
    user: 'postgres',
    host: 'localhost',
    database: ' building_rental',
    password: ' b',
    port: 5432
  });

module.exports = client