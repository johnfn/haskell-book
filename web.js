(function() {
  var BOOK_DIR, DEBUG, DEFAULT_PORT, app, book_parse, chapter_list, chapters, converter, express, file, fs, port, util, _i, _len, _ref;
  express = require('express');
  fs = require('fs');
  converter = new (require('showdown')).Showdown.converter();
  util = require('util');
  DEFAULT_PORT = 3456;
  BOOK_DIR = "chapters/";
  chapter_list = [];
  _ref = fs.readdirSync(BOOK_DIR);
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    file = _ref[_i];
    if (file.indexOf("chapter") !== -1 && file.indexOf(".sw") === -1) {
      chapter_list.push(file);
    }
  }
  chapter_list.sort();
  DEBUG = true;
  book_parse = function(list) {
    var contents, file, _j, _len2, _results;
    _results = [];
    for (_j = 0, _len2 = list.length; _j < _len2; _j++) {
      file = list[_j];
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
