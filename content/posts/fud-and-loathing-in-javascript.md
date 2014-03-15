---
aliases: ["/archives/1551"]
title: "FUD and Loathing in JavaScript"
date: "2011-06-24T15:10:58-05:00"
tags: ["fud", "javascript"]
guid: "http://blog.afoolishmanifesto.com/?p=1551"
---
A coworker sent [this](http://arstechnica.com/microsoft/news/2011/06/nodejs-coming-to-windows-azure-with-official-microsoft-support.ars?comments=1#comments-bar) to our internal mailing list, partially to goad me into responding to the stupid comments. I don't have an ars account, so I'll just hope that trackbacks work.

Here are the arguments that someone actually put effort into making:

> a) Magic 'this'. This is this, except when this is that. JavaScript pushes you to use anonymous functions all over the place, except they always end up losing the proper context for the 'this' variable, so you end up having goofy code like "var _this = this" all over the place and then using that inside your callbacks or other functions. Some days I swear that the number of functions I manage to write that don't use a renamed 'this' are actually smaller than the number that do.

If you think it's magic you clearly don't understand it. That's not really an argument. I agree that sometimes it's confusing, but sometimes programming is hard. Sorry?

> b) 1 + "1" - 1 = 10. Also, "1" + 0 = "10". Yes, this actually has caused bugs for our applications, where data that's expected to be a number was loaded from a JSON file as a string due to a bug in another application, and the result was not good. All our loading code had to be updated to add a ton of type conversions all over the place. When I need something to be a number I really freaking absolutely want it to be a number, not a string or an object or null or anything else. Lua, which is very similar to JavaScript in most respects, fixed this problem by just not being retarded enough to use the same operator for addition and string concatenation.

I agree, this sucks, but I hit it rarely enough that it **doesn't discount the language**.

> c) Global by default variables. So even if you take the argument that dynamic typing is just "easier" because you don't have to think about variable declarations, JavaScript throws that argument out the window by making you put 'var' in front of new identifiers all over the place. And then it silently screws you if you forget to.

Again, I disagree with this, but maybe because we use Perl and Perl works the same way (with the advantage of use strict, which some JavaScript implementations [recently added](http://ejohn.org/blog/ecmascript-5-strict-mode-json-and-more/) but doesn't really handle that issue as far as I can tell.)

> d) Prototypes instead of classes. There are very few large-scale real-world JavaScript applications in existence that don't plug in their own class system to work around the inherent uselessness of prototypes in large application architecture. Those same apps make minimal use of prototypes to extend the base JavaScript types, and only because JS was so poorly designed that even the two interesting built-in types it comes with are lacking half the features you'd expect them to have.

Wow I can't believe how much I disagree with this. Prototypes give you more flexibility, so sure, they have caveats, but I totally think it's worth it. Like a lot of things, you need to exercise discipline when using them, but I can think of numerous times in our real world, medium sized app (14K lines of JavaScript) where it's helped to have.

> e) Inability to create pass-by-value types. This is a frequent problem in just about every language aside from C++/D, actually. For those using JavaScript to write WebGL apps, take a look at all the linear algebra libraries for JavaScript. In 3D apps, you almost use vectors more often than you do scalars. Imagine if every integer in your app was passed by reference, so that "a = 1; b = a; b++" made both a and b equal to 2. Every little three component vector is a complete full object. They are passed by reference (the source of almost a half of the bugs in our WebGL game so far, in fact). They exist in great quantity, are heap-allocated, and are garbage-collected, which puts an intense amount of pressure on the GC which can and does result in GC pauses in even simple WebGL games, unless the developer jump through ridiculously complicated hoops to avoid creating new vectors in all the places where it's logical to create new vectors. You can't have operator overloading, so you have very large and ugly expressions to do basic operations. Accessing individual components is slow. The objects aren't natively packed and hence are incredibly slow to push into a vertex buffer, unless you implement them as a Float32Array instances, which confuses the crap out of the optimizers of both V8 and SpiderMonkey currently. Did I mention they're passed by reference?

I can't relate with this. I just have never needed to pass anything other than a scalar by value, and those **are** pass by value. I can see that it's a real issue for games and whatnot though. Also realize this argues against the poster's language of choice.

> f) No built-in include or require functionality. Seriously, still. Third-party libraries exist but almost all of them have some kind of bug or another, not least of which is a confusing caching problem in at least Chrome making doing actual development a pain in the butt.

Using a third party library should be expected. JavaScript isn't Python, it's not made to be "batteries included." If there are bugs in a library you use you should fix those bugs.

> g) Dynamic typing. Yes, I'm willing to start that argument. You start noticing it the most the second you stop writing little Web apps or Web pages and start writing large apps where you actually have data that persists for longer than a single mouse click or request/response cycle: add the wrong kind of object to an array to process later and get a crash later from a missing method or member in a completely different bit of code than where the actual mistake was. Fun times. Yes, Java makes static typing seem evil. No, Java/C#/C++ are not the one and only way to do static typing. Type inference, implicit interface binding, etc. give you all the "easy to deal with and not a lot of keystrokes" advantages of dynamic typing without all the bugs. The second most popular Web language -- ActionScript 3 -- is statically typed, in fact, despite otherwise being identical to JS/ECMAScript. As an aside, I get more crashes from the Python apps on my Fedora desktop than I do from the C/C++ apps (actually, none of the C/C++ apps on my desktop crash, now that I think about it). Missing member exceptions == so much easier to develop and maintain apps, right?

I don't think I've had a type issue in our "large [app] where [we] actually have data that persists for longer than a single mouse click" for longer than a typo.

> h) Speed. Yes, there has been some ridiculously immense amounts of effort by a large number of super bad-ass developers put into the language runtimes to make JS almost half as fast as a low-grade C compiler that a single college Junior could write in a few months. And LuaJIT is in the same boat as JS in terms of fundamental language limitations but manages to do better than every JavaScript implementation anyway. People who don't understand what all the JS optimizations in V8 or such actually _do_ like to claim the JS can do amazing things speed-wise, but the reality is that all those optimizations are basically just "try very very hard to analyze the code to figure out types for variables and then compile it like a slightly retarded statically-typed language's compiler would do it." Oh, and there's tracing, but then tracing also works on statically typed languages (and works better due to a lack of need for type guards in the generated machine code). Not a single one of those whizbang optimizations was invented by or for JS, in fact; most were taken from research JVMs (Java is evil!) or classical OOP languages (prototypes are awesome!).

Nice! So the poster says: "JS is fast, but not as fast as C and the things that made it fast were taken from other VM's so it doesn't really count." Ok Mr. C#, I'm sure you're correct since C# is entirely original research :-) Also, is C# as fast as C?

> i) No IntelliSense even possible. Want to see what methods exist on that variable you've got there on line 187 of foo.js in your text editor? Too bad. Go trace through the code until you figure out where it was initialized, then go trace through the code to find out what its prototype has on it. And then hope there's no code dynamically changing the prototype behind your back. In fact, just run it in a browser and set breakpoints, because finding out anything useful about the value any other way is basically impossible for any codebase larger than the toy_web_app.html sites that JavaScript apologists use to glorify the ease and simplicity of JavaScript. Some code editors try _really_ hard to do better, and almost kinda sorta succeed for the really simple cases, sometimes, once.

Yeah, that's a real thing I guess, but I'm not the target user of IntelliSense anyway.

> j) No advantage. JavaScript isn't even special compared to other dynamically typed language. It is not capable of doing anything interesting at all all that can't also be done by Lua, Python, Ruby, etc. None of the JS implementations are any faster than LuaJIT or PyPy or various other advanced JIT-ing implementations of other dynamic languages. JS has no plus sides to it compared to other commonly available languages. Oh, except it runs natively in a Web browser without a plugin. Which is the only reason in the world why it's so popular. In fact, it's the only reason it event _exists_. If someone 10 years ago had just thought, "heck, let's drop an existing well-designed and well-established language into our browser and get the other guys to do the same instead of making everyone use this goofy little hackjob that NetScape came up with," the Web would look a lot different (better) today. Just imagine the future if Chrome dropped Python into Chrome as a supported language. Or actually, imagine this: Google drops C/C++ into Chrome as a supported language (http://code.google.com/p/nativeclient/).

The fact that it's the most widely deployed VM in the world isn't an advantage? The fact that there are three major VM's leading to healthy competition and improvements isn't an advantage? The fact that it's in all browsers **right now** (unlike some crazy future where browsers need to implement C or (**good lord!**) C++ safely) isn't a feature?

Maybe I'm just a tool for thinking this guy just has confirmation bias. I've [done the same](/archives/1485) thing of course in arguing against C#, so maybe I'm just as bad, but I can hardly take these arguments as reasons not to use JavaScript.