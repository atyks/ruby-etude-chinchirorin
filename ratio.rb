# -*- mode:ruby; coding:utf-8 -*-

class Ratio
  def initialize(hash, total)
    @hash = hash
    @total = total
  end

  def toRatio()
    results = {}
    results.default = 0

    @hash.each do | key, value |

      results[ key ] = sprintf("%1.3f", value.to_f / @total.to_f)

    end

    return( results.sort )
  end
end
