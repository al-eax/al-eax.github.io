---
date: '2025-01-13T01:48:35+01:00'
draft: true
title: 'S5max Water Leaking'
tags: ["random"]
author: "alex"
showToc: true
TocOpen: false
hidemeta: false
comments: false
description: ""
disableShare: false
hideSummary: false
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowWordCount: true
UseHugoToc: true
cover:
    image: "/en/posts/2025-01-13_s5max-water-leaking/s5max.png" # image path/url
    relative: false
---

Last christmas I bought my self an old used [Roborock S5max vacuum robot](https://us.roborock.com/pages/roborock-s5-max).
I got it for 65€, which is cheap since some get sold for the doubled price.
The robot comes with a mountable water tank and can also mop the floor.


After some runs I noticed that the robot leaves puddles on the ground, espacially on doorsteps.
I removed the water tank and discovered that somehow water was accumulating between the water tank and the mop.
As soon as the robot moves jerkily, it leaves a puddle behind.


After dismounting the tank I noticed that water was leaking from nozzle from the tank to the mop as this sketch shows:

![](/en/posts/2025-01-13/leaking-water.png)

1. water tank
2. water dropping from the tank on the mop
3. water dropping from the tank unter the tank <-- the problem lies here!


I did some research and found serverel threads about this problem [[2]], [[3]], [[4]].
In the Roborock user forum, the vendor suggests to put some oil around the two water nozzle to avoid leaking water [[5]].
How ever, some people claim this solution only works for a few session until the robot starts dropping puddles again.


In [[1]] some people describe how they fixed this issue by closing the gab between the nozzle and the mop, as shown in this sketch:

![](/en/posts/2025-01-13/fixed-leaking-water.png)

Therefor we need some kind of pipe which matches the size of the nozzle.


[1]: https://www.roboter-forum.com/threads/wasser-tropft-beim-wischen-auf-fussboden.44225/post-678407
[2]: https://www.reddit.com/r/Roborock/comments/lc0os3/help_roborock_s5_max_leaves_a_lot_of_puddles_what/?tl=de
[3]: https://www.reddit.com/r/Roborock/comments/j2h03n/s5_max_leaves_small_puddles/?tl=de
[4]: https://www.smarthomeassistent.de/saugroboter-wischroboter-wischt-nicht-mehr-tropft-das-hilft/
[5]: https://forum.roborock.com/discussion/3310/my-roborock-s5-max-is-leaking-water-when-mopping
