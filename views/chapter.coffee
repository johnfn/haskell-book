doctype 5
html ->
  head ->
    title 'Haskell for People. Better title pending.'
    link rel: 'stylesheet', href: 'style.css'
    link rel: 'stylesheet', href: 'github.css'
    script src: "highlight.pack.js"

    coffeescript ->
      hljs.initHighlightingOnLoad()

  body ->
    div -> @content
    div ->
      a href: "/1", -> "Next chapter!"
    footer ->
      "Haskell for People is a book written by Grant Mathews. Feel free to contact me at johnfn at gmail.com with suggestions, questions, feedback, etc. This book is also open source! Check it out <a href='http://www.github.com/johnfn/haskell-book'> on github</a>."
