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
      when "グー\n", "チョキ\n", "パー\n"
        puts stand.select_hand
        stand.prospect.push hand.chomp
      else
        puts stand.select_hand
      end
    end
  end
  
  class Boy2Man
    attr_accessor :prospect

    def initialize
      @prospect = %w(グー チョキ パー)
    end
    
    def select_hand
      case predict
      when "グー"   then "パー"
      when "チョキ" then "グー"
      when "パー"   then "チョキ"
      end
    end

    private
    def predict
      @prospect.sample
    end
  end
end
