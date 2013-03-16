ruby-etudo-chinchirorin
=======================

practice of ruby. As the theme of chinchirorin, Japanese game "チンチロリン"
for more infomation to "Chinchirorin", see [Wikipedia in Japanese](http://ja.wikipedia.org/wiki/%E3%83%81%E3%83%B3%E3%83%81%E3%83%AD%E3%83%AA%E3%83%B3)

this Repogitry has 2 programs.
1. "dice" Simulation. Roll dice and Statistics for it's results
2. "chinchirorin" Simulation. Japanese game, using dice.

how to use
=======================

1. "dice" Simulation
-----------------------------
$ ruby 01.avarage.rb [-a] [-n] [Number Of Rolls]

### options ###
#### -a ####
display Statistics for dice roll, and display no results for dice roll. default is none

#### -n ####
pips number of dice. default is 6

#### Number Of Rolls ####
number of roll. default is 1.

### Sample. roll dice by default ###
$ ruby 01.avarage.rb
> "dice pips 6, and throw 1 times "
> 6

### Sample. roll dice that has 3 pips ###
$ ruby 01.avarage.rb -n 3
> "dice pips 3, and throw 1 times "
> 2

### Sample. roll dice, 5 times ###
$ ruby 01.avarage.rb 5
> "dice pips 6, and throw 5 times "
> 5
> 2
> 3
> 4
> 4

### Sample. roll dice, 5 times and show Avarage ###
$ ruby 01.avarage.rb -a 5
> "dice pips 6, and throw 5 times"
>   1  | 0.400 |
>   3  | 0.200 |
>   4  | 0.200 |
>   5  | 0.200 |

2. "chinchirorin" Simulation
-----------------------------
$ ruby 02.chinchiro.rb [-a] [Number OF Games]

### options ###
#### -a  ####
display Statistics for chinchirorin, and display no results for chinchirorin. default is none

#### Number OF Games ####
number of roll. default is 1.

### Sample. throw chinchirorin by default ###
$ ruby 02.chinchiro.rb
> ピンゾロ	[1, 1, 1]

$ ruby 02.chinchiro.rb
> 出目-3	[3, 6, 6]

### Sample. throw chinchirorin, 5 times ###
$ ruby 02.chinchiro.rb 5
> 出目-3  [1, 1, 3]
> 目無し  [2, 3, 5]
> 出目-6  [5, 5, 6]
> ヒフミ  [1, 2, 3]
> 目無し  [1, 3, 6]

### Sample. throw chinchirorin, 5 times and show Avarage ###
$ ruby 02.chinchiro.rb -a 5
> 出目-3 : 0.200
> 出目-4 : 0.400
> 出目-5 : 0.200
> 目無し : 0.200
	