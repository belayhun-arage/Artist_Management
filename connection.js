const { Client } = require('pg')

const client = new Client({
    user: 'postgres',
    host: 'localhost',
    database: 'Artists',
    password: ' b',
    port: 5432
  });

module.exports = client