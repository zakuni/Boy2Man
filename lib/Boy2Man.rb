#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require "Boy2Man/version"

module Boy2Man
  
  def self.play
    stand = Boy2Man.new
    loop do
      print '> '
      hand = gets
      case hand
      when "\n", "bye\n", "exit\n"
        exit
      when "グー", "チョキ", "パー"
        puts stand.select_hand
      else
        puts stand.select_hand
      end
    end
  end
  
  class Boy2Man
    def select_hand
      %w(グー チョキ パー).sample
    end
  end
end
