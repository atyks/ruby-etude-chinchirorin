# -*- mode:ruby; coding:utf-8 -*-
require 'optparse'

class Option
  attr_accessor :options
  def initialize()
    @options = {}

    # オプションを受け入れるように
    ARGV.options {|opt|
      # サイコロの眼の数
      opt.on('-n VAL') { |v| @options[:n] = v }

      # 振った数ではなく、出た目の出現率を表示する
      opt.on('-a', '--avarage') { |v| @options[:a] = v }

      opt.parse!(ARGV)
    }

  end
end
