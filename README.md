StatusBarDemo
=============

This demonstrates (roughly) the feedly status bar notification. I'm curious if there is a particular library that gives you an effect closer to theirs, and if not, what they actually are adding it to/animating it from.

Trying MTStatusBarOverlay, it appears iOS6 + it aren't visually compatable with nonblack overlays, so I briefly rolled my own that gets about 85% of the way there. I don't like the abruptness with which the normal status bar comes back so far.

Would love to figure out how to do this best so it ALSO works with iPad compatble sized iPhone apps though (aka, an iPhone only app installed on an iPad, so it's in the middle of the screen, with possible 2x sizing).

Do whatever you want with this code, no attribution needed

What I'm going for: 
![Feedly Status Bar](https://github.com/langford/StatusBarDemo/blob/master/Feedly%20Status%20Bar.png?raw=true)
