const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send(`Hello World! From ${process.env.SERVER_NAME}`)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
