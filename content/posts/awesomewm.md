---
aliases: ["/archives/1761"]
title: "awesomewm"
date: "2012-07-04T08:00:33-05:00"
tags: [awesome, tiling-window-manager, window-manager, xmonad]
guid: "http://blog.afoolishmanifesto.com/?p=1761"
---
I've had a long, sordid relationship with window managers. When I really started with my first computer it was Windows 98 and I somehow decided to put [Litestep](http://en.wikipedia.org/wiki/Litestep) on it. I remember switching workspaces was often crashy and I pined for something less hacky. Eventually I installed some form of linux.

Because Litestep was inspired by [AfterStep](http://en.wikipedia.org/wiki/AfterStep) I knew that's what I really wanted. But I was wrong. I may have wanted that if I were already a console user, but I was weening myself out of windows. So I ended up, after playing with every WM Redhat came with (more than enough!) using Gnome, since I think KDE was still [having licensing woes](http://en.wikipedia.org/wiki/Kde#Licensing) at the time.

Eventually I got tired of my 64M of ram always being full of widgets, so I switched to [Window Maker](http://en.wikipedia.org/wiki/Window_maker). It was nice and small and I got a lot of what I'd wanted from Litestep early on. I don't recall going crazy configuring WM, and I think during that time I also fiddled with [Blackbox](http://en.wikipedia.org/wiki/Blackbox), [Openbox](http://en.wikipedia.org/wiki/Openbox), and [Fluxbox](http://en.wikipedia.org/wiki/Fluxbox). I think the thing I remember about those four WM's was that they all had various degrees of edge snapping/resistance, which was something sorely lacking elsewhere. I used [Enlightenment](http://en.wikipedia.org/wiki/Enlightenment_%28window_manager%29) in there somewhere, but it was also megabloated and I think it was scripted in python or something equally esoteric to [young frew](http://frew.livejournal.com/) (hint: it was perl.)

Eventually I decided to get hardcore and use the WM of champions, which mst uses to this day, [FVWM](http://en.wikipedia.org/wiki/Fvwm). I had a [fairly involved configuration file](https://github.com/frioux/dotfiles/blob/45cb7e0a3c9df7596bace3300542418ab93f58ed/.fvwm/.fvwm2rc), or at least it was to me then. One of the things I really liked was that I had it set up so that even if a window was fullscreen there was a small border of background to the left and if I scrolled the mouse there it would volume up/down and if I clicked it would pop up the osd to show what song was currently playing.

I used FVWM for a long, long time. At least four years, because I used it all the way through college on my desktop.

But in my sophomore year of college I also got a laptop! I kept windows on it for at least a year but eventually I got annoyed with it and put the exciting new Ubuntu on it (desktop was Gentoo.) My goal was for the laptop to remain as usable as possible, so I left vanilla gnome on it for a few months but, as I normally find with gnome, the ram usage eventually bothered me and I looked elsewhere for my account (but I made accounts for all my [TOME](http://code.google.com/p/ptome/source/browse/?r=546) hackers so they could use GNOME if they wanted to.)

The RAM on my laptop was important, but so was screen realestate. I was used to gigantic 64x64 widgets and that just wasn't going to work on lappy. So what I used for a year or two was [Wmii](http://en.wikipedia.org/wiki/Wmii). Wmii does tiling, but I basically used it for exclusively single full screen stuff. I also used it with an awesome delicious integration thing which [I partially reimplemented](http://rubyforge.org/projects/delish/) more generically later.

Fast-forward a year or two and I'm working at [Micro Technology Services, Inc.](http://mitsi.com/) (where I still work) and I'm stuck on windows. I found that with two large monitors I needed some form of tiling or I couldn't effectively get work done. [I started](/posts/splits-panes-and-tiles) with [GridMove](http://jgpaiva.dcmembers.com/gridmove.html), which is awesome and super configurable, but eventually ended up with [WinSplit Revolution](http://www.winsplit-revolution.com/).

At some point a year or two after I started I decided to make a new computer for home use. My friend [fjord](https://plus.google.com/u/0/105088029783860927078/posts) convinced me to try out XMonad. I really liked it on my laptop once I learned the key combinations. On the desktop I initially thought that the multihead workspace support was bizarrely buggy, but it turned out to just be sufficiently advanced to appear to be nonsense. I eventually learned that the multihead support was a huge step forward and something I'd be loathe to give up. I [tweaked](https://github.com/frioux/dotfiles/commits/f5b69af69333ff9ea7ba0577ec7f5f34714bafff/xmonad/xmonad.hs) xmonad, but I never really learned haskell. Maybe that's because I'm dumb, maybe it's because haskell has a compiler with bad error messages and pointlessly complex syntax. I used XMonad in anger faithfully until a few weeks ago.

About 6 days before [this year's
yapc](https://web.archive.org/web/20120322024109/http://act.yapcna.org/2012/schedule)
I spilled a drink (mellonballer) on my laptop. I couldn't get it fixed at work
so I gave up and ordered a new laptop the next day. Said laptop arrived an hour
before I left for yapc, which means I left with windows 7 still on it. While at
yapc I figured (well, a friend figured out) out how to boot a usb drive and
install ubuntu, but I wasn't going to try to get XMonad working with gnome 3 or
(or LXDE as I had on one machine, but failed to on another) until I was back
home.

So finally, last friday, the 29th, I decided to try to get XMonad to work with LXDE. I should probably elaborate on why that's important to me. XMonad, as far as I could ever find out, doesn't ship with any kind of system tray. I needed a system tray so I could at least run NetworkManager for wifi. I tried wicd and had no luck and really, how much work should a person do on something as boring as making wifi work? So what I did for a long time was have XMonad with a Gnome 2 toolbar. I really liked that configuration, but gnome 2 went the way of the dinosaurs when gnome 3 came out and ruined everything. I could never get Gnome 3 to work so I switched to LXDE and that actually worked really well. The first time. On one machine. I couldn't get it to work again. I even tried getting XMonad to work with [mate](http://mate-desktop.org/) since it's what I wanted, but I was mocked by the xmonad people for not being hardcore enough to reimplement my desktop and the mate people were mostly clueless.

So on friday I tried and failed to get xmonad to even work. To be clear, I tried to start it, plain, without gnome or mate or whatever, and I got a compilation error from haskell. This stupid cargo-cult config just stopped working over the total of about 18 days that I wasn't using it. So I decided to look elsewhere. I found awesome. Basically I have it working almost exactly how XMonad did modulo some actual GUI and some more tweaking. Awesome can actually do what I wanted my toolbar for (what gnome 2 offered, cpu + ram graphs, weather, and a clock) and some other things I am surprised I was missing. Anyway, [my dotfiles are on github as always](https://github.com/frioux/dotfiles/tree/5f34105f8cf2144bfb9bb9c3aede72459d317064/awesome). Here are my pros/cons:

### Awesome pros (vs XMonad)

- lua is easy
- the builtin toolbar isn't stupid (supports more than text)
- lots and lots of libraries that, being lua, even without doc are easy to grok
- a nice lib (vicious) that nicely separates logic and presentation of widgets, so my cpu and ram graphs use the same widget but different guts
- despite the fact that it's minimal, the stuff that it comes with is enough for me to actually use NetworkManager easily (I couldn't get that to work with xmonad last I tried)
- It's not functionally pure, so it's not as stable as xmonad-- oh wait, I kid, xmonad crashed more than any wm I've used since WindowMaker

### Awesome cons (vs xmonad)

- The way that xmonad handles multihead, once you get used to it, is lifechanging. Awesome doesn't do this by default but there's a library that gets you 85% there (I'll be adding the other 15%)
- sometimes when restarting awesome, even though it checks that the syntax is valid, you still end up with an invalid config, which means it falls back to the standard config, which can be really disorienting if you, for instance, change your modkey

I've been very happy with what I've come up with for awesome. The developer of awesome wrote [a blog post](http://julien.danjou.info/blog/2009/taking-the-other-direction) that confirms what I think that awesome is a very good WM development toolkit. Sure, it may not be sufficient to run a space station (XMonad) but it's very easy to hack on. Some of the things I've implemented with googling and a bit of help from IRC and the ML are: battery, memory, and cpu graphs (already more than gnome 3!), all with mouseovers to give actual numbers. Three weather widgets that show the temperature in different places, on mouseover give lots more details, and on click bring up the weather.com pages for each place. A volume thing that works with scroll bar and click to change the volume. A clock that shows a calendar on mouseover. XMonad style sharing of workspaces across screens (not perfect, but getting there.) And it has some neat ideas like a window being in multiple (but not necesarily all) workspaces at a time.

Add all those features to the fact that it doesn't leak like a sieve like gnome 3 does (gnome-power-manager leaked last I checked) and I think I'm likely to use awesome even longer than I used xmonad. I'm sure awesome won't be the end of my journey; but I think awesome will last a long time.
