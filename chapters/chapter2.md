# Chapter 1

*This chapter is meant to be a reference. Feel free to skim over it now, and come back later if some syntax is unfamiliar to you.*

## Lists!

    myList = [1,2,3,4]

Lists are groups of values in order. Key facts about lists:

* Every item in a list must be the same. `["a", "a"]` is fine. `[1, 2]` is fine. `[1, "A"]` is bad times.

Lists are core to Haskell, so you get a lot of functions that operate on lists for free.

    [1,2] ++ [3,4] == [1,2,3,4] -- combine lists
    1:[2,3,4] == [1,2,3,4] -- add element onto list (known as cons in some languages)

    [1,2,3,4] !! 1 == 2 -- get element at a position

    head [1,2,3,4] == 1 -- get first item of list
    tail [1,2,3,4] == [2,3,4]  -- get all but head
    last [1,2,3,4] == 4  -- final item of list
    init [1,2,3,4] == [1,2,3]  -- get all but last

    null [1,2,3,4] == False
    null [] == True -- is given list empty?

    length [1,2,3,4] == 4 -- number of elements in the list.

There are many more! Check them out at http://haskell.org/ghc/docs/latest/html/libraries/base/Data-List.html. I'll be explaining the rest as they appear in practice.

## Tuples!

Tuples are lists with

* Fixed size
* Different types `("a", 1)` is a valid tuple. (If you wanted to sound smart, you can say that lists are <em>homogenous</em> and tuples are <em>heterogenous</em>.[1])

Two important Tuple functions:

    fst (1,2) == 1 -- (first)
    snd (1,2) == 2 -- (second)

## Functions!

### Function calling:

You call functions like this:

    myFunc 1 2 3 4 "ham sandwich"

To call many functions:

    myFunc (superFunc 1 2 3)

The parens are for operator precedence bla bla TODO

Since Haskell programmers are allergic to parenthesis, they came up with $, which means "wrap this statement in parenthesis from here to the end." That last code sample could be written as:

    myFunc $ superFunc 1 2 3

### Function making:

Behold! This is arguably the most important part of Haskell.

    add x y = x + y

This declares the function `add`, which takes two arguments, `x` and `y`, and returns their sum.

You can augment function definitions with lots of fun things. Haskell stresses *lots of simple functions* over big hairy scary messes, and gives you lots of ways to do this.

### Pattern Matching

One way is called pattern matching, which is a way to check for argument values ahead of time.

    -- Remember null from the list functions? Go look up a bit if you forgot.
    null [] = True
    null _ = False

Equivalent imperative code:

    function null(array){
      if (array == []){
        return True;
      } else {
        return False;
      }
    }

When you call null, Haskell steps through the functions from top to bottom. If you called `null []`, it matches the first pattern and returns `True` immediately. 

If you didn't, it hits the _ case. "_" means "match anything", so if the list isnt `[]` our null will return False.

### Destructuring in pattern matching

Destructuring lets you pull apart more complicated data structures.

    -- This is the actual definition of fst and snd.
    fst (x, _) = x
    snd (_, y) = y

Equiavlent imperative code:

    function fst(tuple){
      return tuple[1];
    }

What's going on here is that we're passing in a tuple like (1,2) into fst/snd. Haskell allows us to say "This argument is a tuple, and I want to give names to its values" in the nice way that you see. Since we don't ever use the second value of the tuple, we just make it _.

If you want to name the object you just destructured, use @. TODO.

### List destructuring:

    length [] = 0
    length first:rest = 1 + length rest

The important part is first:rest, where you destructure the passed in list to `head list` and `tail list`. I named the arguments `first` and `rest` for clarity; x:xs is more idiomatic.

    trimLeadingWhitespace "" = ""
    trimLeadingWhitespace " ":rest = trimLeadingWhitespace rest
    trimLeadingWhitespace anything = anything

### Guards:

Guards are yet another way to break down functions into smaller parts.

TODO: This is suboptimal since head str is pattern matchable...

    trimAllWhitespace "" = ""
    trimAllWhitespace str 
      | head str == " " = trimAllWhitespace (tail str)
      | last str == " " = trimAllWhitespace (last str)
      | True = str

Here, the guards are the `|` and the condition afterwards. If the condition is true, then Haskell will run the body.

### Where:

Where allows you to share some code among all pattern matches and guards of a function. 

TODO: I think this function is too hard?

    stripPunctuation word 
      | startsWithPunct word           = stripPunctuation $ tail word
      | startsWithPunct $ reverse word = stripPunctuation $ init word
      | otherwise = word
      where
        startsWithPunct str = head str == "." || head str == "?"

(Tip: `otherwise` is defined to be `True`. It makes writing guards nicer.)

## Syntax

### Let



## Footnotes:

[1]: Richard Feynman once said something along the lines of how there's no purpose to use complicated vocabulary when simple vocab will do. I agree.
