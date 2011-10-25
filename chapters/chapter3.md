# Chapter 2: Tools, Tips, Tricks

*This chapter is a reference. If I start talking about some tool you don't know about, check in here.*

## ghci

`ghci` is the Haskell REPL. If you don't know what a REPL is, read on!

A REPL (stands for read-eval-print-loop) is a great way to test out writing some code without going through the whole make and build process. What it does is allow you to write one line of code at a time and see the output immediately. Try booting up ghci right now, so you can see what I'm talking about.

    Prelude> 1 + 1
    >> 2
    Prelude> let x = 5
    Prelude> print x
    >> 5
    Prelude> let myAdd a b = a + b
    Prelude> myAdd 1 2
    >> 3

The stuff you type into ghci comes after `Prelude>`. To be clear, I've chosen to show what it gives back with `>>` even though ghci doesn't use those.

It's important to keep in mind that ghci runs inside an implicit `do`. If you know what that means so far, great. If not, just know that there are some subtle changes from normal coding. Function and variable definitions have to start with `let` like I showed above.

`ghci` has some other neat abilities. Here's one:

    Prelude> let myAdd a b = a + b
    Prelude> :type myAdd
    myAdd :: (Num a) => a -> a -> a

Yeah! Types for free! Type inference FTW! This is great for testing stuff out when Haskell is complaining about your types for some reason.

## hoogle

[Hoogle](http://www.haskell.org/hoogle) may just blow your mind. It allows you to search for Haskell functions *by type signature.* This may not sound like a big deal, but man, you just gotta try it. 

Say I wanted to find `length`. Go type in `[a] -> Int`. Boom, first suggestion.

What if you forgot `init` (it does have a weird name, after all)? Search for `[a] -> [a]`. It's right there.

IS YOUR MIND BLOWN YET?

## hlint

`hlint` is awesome. It analyses your code and tells you if (usually, that) you're doing dumb things. 

## Footnotes:
