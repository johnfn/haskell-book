(function() {
  var BOOK_DIR, DEBUG, DEFAULT_PORT, app, book_parse, chapter_list, chapters, converter, express, fs, port, util;
  express = require('express');
  fs = require('fs');
  converter = new (require('showdown')).Showdown.converter();
  util = require('util');
  DEFAULT_PORT = 3456;
  BOOK_DIR = "chapters/";
  chapter_list = fs.readdirSync(BOOK_DIR);
  DEBUG = true;
  book_parse = function(list) {
    var contents, file, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = list.length; _i < _len; _i++) {
      file = list[_i];
      contents = fs.readFileSync(BOOK_DIR + file, "UTF-8");
      _results.push(converter.makeHtml(contents));
    }
    return _results;
  };
  chapters = book_parse(chapter_list);
  app = express.createServer(express.logger());
  app.set("view options", {
    layout: false
  });
  app.set('view engine', 'coffee');
  app.use(express.static(__dirname + "/public"));
  app.register('.coffee', require('coffeekup').adapters.express);
  app.get('/', function(request, response) {
    return response.render('index', {
      entries: chapter_list,
      ch: chapters
    });
  });
  app.get('/:id', function(request, response) {
    if (DEBUG) {
      chapters = book_parse(chapter_list);
    }
    return response.render('chapter', {
      content: chapters[parseInt(request.params['id'])]
    });
  });
  port = process.env.PORT || DEFAULT_PORT;
  app.listen(port, function() {
    return console.log("Listening on http://localhost:" + port);
  });
}).call(this);
