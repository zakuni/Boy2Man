#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require "Boy2Man/version"

module Boy2Man
  
  def self.play
    stand = Boy2Man.new
    puts stand.select_hand while gets != "\n" 
  end
  
  class Boy2Man
    def select_hand
      %w(グー チョキ パー).sample
    end
  end
end
