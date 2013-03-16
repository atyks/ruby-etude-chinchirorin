# -*- mode:ruby; coding:utf-8 -*-
require './dice.rb'
require './option.rb'

# コマンドラインの引数を取得する
opt = Option.new()

# サイコロクラスを生成
d = Dice.new(opt.options[:n])

num = ARGV.pop.to_i
num = 1 if( num < 1)

p sprintf("dice pips %d, and throw %d times", d.pip, num)

# 振る。
num.times do
  v = d.roll();

  print v.to_s + "\n" if ! opt.options[:a]
end

# 振った結果出た目の確率を求める
if ( opt.options[:a] ) then
  d.getAvarage().sort.each do | key, value |
    print sprintf("%3d  | %1.3f | \n", key , value)
  end
end