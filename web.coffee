express = require 'express'
fs = require 'fs'
converter = new (require 'showdown').Showdown.converter()
util = require 'util'

# TODO hightlight = require 'hightlight'

DEFAULT_PORT = 3456
BOOK_DIR = "chapters/"

chapter_list = []

for file in fs.readdirSync BOOK_DIR
  if file.indexOf("chapter") != -1 and file.indexOf(".sw") == -1
    chapter_list.push(file)

chapter_list.sort()

DEBUG = true

book_parse = (list) ->
  for file in list
    contents = fs.readFileSync BOOK_DIR + file, "UTF-8"
    converter.makeHtml(contents)

chapters = book_parse chapter_list

app = express.createServer express.logger()

app.set "view options", layout : false
app.set 'view engine', 'coffee'

app.use(express.static __dirname + "/public")

app.register '.coffee', require('coffeekup').adapters.express

app.get '/', (request, response) ->
  response.render 'index', entries : chapter_list, ch : chapters

app.get '/:id', (request, response) ->
  if DEBUG
    chapters = book_parse chapter_list

  response.render 'chapter', content : chapters[parseInt request.params['id']]

port = process.env.PORT || DEFAULT_PORT
app.listen port, () ->
  console.log "Listening on http://localhost:#{port}"
