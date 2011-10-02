# Chapter 0: Prelude

This aims to be a *practical* guide to Haskell. Above all, I want you to come away from this knowing how to make super cool stuff.

The problem with Haskell tutorials these days is that most of them will go over abstract code sample after abstract code sample. They'll say something like, look! 

    fold (+) (map (\x -> x + 1) [1, 2, 3]) 0
    >> 9

Isn't that amazing! Didn't you always want to add 1 to each element of an array, and then sum it?!

I don't find this helpful. I learn by doing. I've learned the most about a language when I just sit down and make something awesome with it.

For me, Haskell (and FP) tutorials are just too abstract.

It's not their fault, though. Let's see what the reason is.

## Why are non-FP tutorials better?

The great thing about OOP is that it namespaces functions really well. So, if you ever want to find some string-related method, just look at the String object, and boom! There they are. Arrays? Yep, Array class. This is awesome for learning the language, because you have a place to start.

## And what's wrong with FP tutorials?

Functional programming languages can feel like they're filled with tons of random functions. It can even feel like that's the *point!* I mean, it's in the name! FUNCTIONAL languages! What do you expect? Candy?

So when you try to learn a functional language, it's tempting to try to learn ALL OF THE FUNCTIONS, because that's clearly the point! Right? 

But since they are now decontextualized, we may as well present them in their purest, most abstract state. 

And now we're writing examples like the first code sample that don't help people like me learn.

Even worse, this gives functional programming a bad rap. Because people only see examples in super abstract mathematical functions, they tend to think of those languages in those terms: obscure, mathematical, abstract. Even scary.

But none of this has to be true. Haskell isn't actually scary, obscure, or abstract[1]. It's a very neat language, for doing practical things.

Now let's go make something cool with Haskell!

## Footnotes

[1]: I can't deny that it's mathematical, but you don't have to worry about that.

What? What's a footer? This isn't a footer, is it?
