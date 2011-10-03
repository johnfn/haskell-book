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
            h2 -> a href:"/0", class: "chapter-title", -> "Chapter 1: Prelude"
            div class: "detail", -> "Why another Haskell tutorial?"
          li ->
            h2 -> a href:"/1", class: "chapter-title", -> "Chapter 2: Syntax"
            div class: "detail", -> "Reference chapter. All of Haskell's syntax in 5 seconds! Or maybe a little longer."
          li ->
            h2 -> a href:"/2", class: "chapter-title", -> "Chapter 3: Tips, tricks, tools."
            div class: "detail", -> "Reference chapter. Helpful tools to keep your code awesome."

      footer ->
        "Haskell for People is a book written by Grant Mathews. Feel free to contact me at johnfn at gmail.com with suggestions, questions, feedback, etc. This book is also open source! Check it out <a href='http://www.github.com/johnfn/haskell-book'> on github</a>."
