# -*- mode:ruby; coding:utf-8 -*-
require './dice.rb'
require "./option.rb"
require './chinchiro.rb'
require "./ratio.rb"

# コマンドラインの引数を取得する
opt = Option.new()

# サイコロクラスを生成
cc = Chinchiro.new()

data = {}
data.default = 0

num = ARGV.pop.to_i
num = 1 if( num < 1)

num.times do
  cc.game()

  if ! opt.options[:a] then
    print sprintf("%s\t%s\n", cc.results, cc.last_basket.to_s)

  end

  data[ cc.results ] += 1
end

ratio = Ratio.new(data, num);

if opt.options[:a] then
  ratio.toRatio.each do | key , value |
    puts sprintf("%15s : %.03f", key, value)
  end
end
