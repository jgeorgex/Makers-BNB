const { Pool, Client } = require('pg')

const pool = new Pool({
  user: 'oliverantcliff',
  host: 'localhost',
  database: 'makers_bnb',
  password: null,
  port: 5432
});

pool.query("SELECT NOW()", (err, res) => {
  console.log(err, res)
  pool.end()
})

const client = new Client({
  user: 'oliverantcliff',
  host: 'localhost',
  database: 'makers_bnb',
  password: null,
  port: 5432
})
client.connect()

client.query("SELECT NOW()", (err, res) => {
  console.log(err, res + "hi")
client.end()
})

const text = "SELECT res_date FROM makersbnb_reservations WHERE user_id = $1"
const values = [1]


client.query(text, values, (err, res) =>{
  if (err) {
    console.log(err.stack)
  } else {
    console.log(res.rows[0])
  }
})
