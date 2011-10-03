doctype 5
html ->
  head ->
    title 'Haskell for People. Better title pending.'
    link rel: 'stylesheet', href: 'style.css'

  body ->
    header ->
      h1 'Haskell for People'
      div class: "tagline", -> "Practical, simple, and simple."
      ol ->
          li ->
            h2 -> a href:"/11", class: "title", -> "Chapter 1"
            div class: "detail", -> "This is a sample description of a chapter of the book. It's fairly long but it isnt so long that you can start learning the book just by reading it."
          li ->
            h2 -> a href:"/0", class: "title", -> "Chapter 2"
            div class: "detail", -> "This chapter changed my life before I started reading it."
      footer ->
        "Haskell for People is a book written by Grant Mathews. Feel free to contact me at johnfn at gmail.com with suggestions, questions, feedback, etc. This book is also open source! Check it out <a href='http://www.github.com/johnfn/haskell-book'> on github</a>."
