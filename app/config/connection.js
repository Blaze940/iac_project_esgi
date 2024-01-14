const mysql = require('mysql');
let connection;

if (process.env.JAWSDB_URL) {
    connection = mysql.createConnection(process.env.JAWSDB_URL);
} else {
    connection = mysql.createConnection({
        host: process.env.ip,
        port: process.env.port,
        user: 'admin',
        password: 'thiZ_is_v&ry_s3cret',
        database: 'rdb'
    });
}

connection.on('connect', () => {
    console.log(`--> Connected to database '${connection.config.database}'.`);
});


const seed = `INSERT INTO todos (task) VALUES ('Finish routing'), ('Add server-side validation'), ('Improve error handling');`


connection.on('error', err => {
    console.log('--> Connection error: ', err);
});

connection.connect();

module.exports = connection;