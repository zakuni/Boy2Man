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
        puts stand.match(hand.chomp)
      else
        puts stand.select_hand
      end
    end
  end
  
  class Boy2Man
    attr_reader :history
    
    def initialize
      @history = %w(グー チョキ パー)
    end

    def history
      # retrun deep copy of history, to prevent history to be changed.
      Marshal.load(Marshal.dump(@history))
    end
    
    def match(hand)
      case hand
      when "グー", "チョキ", "パー"
        # 先に手を決めておかないと後出しになる
        selected = select_hand
        @history.push hand
        selected
      else
      end
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
      @history.sample
    end
  end
end
