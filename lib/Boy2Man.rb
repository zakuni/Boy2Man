#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require "Boy2Man/version"

module Boy2Man
  
  def self.play
    stand = Boy2Man.new
    loop do
      print '> '
      hand = gets.chomp
      case hand
      when "", "bye", "exit"
        exit
      when "グー", "チョキ", "パー"
        puts stand.match(hand)
      when "history"
        puts stand.history
      when "reset"
        stand.reset
      else
        puts stand.select_hand
      end
    end
  end
  
  # @!attribute [r] history
  #   @return [Array] the history of player's hand
  class Boy2Man
    attr_reader :history
    
    def initialize
      @history = Array.new
    end

    def history
      # retrun deep copy of history, to prevent history to be changed.
      Marshal.load(Marshal.dump(@history))
    end

    # @return [Array] resets history
    def reset
      @history.clear
    end

    # @return [String]
    def match(hand)
      case hand
      when "グー", "チョキ", "パー"
        # 先に手を決めておかないと後出しになる
        selected = select_hand
        @history.push hand
        case judge(hand, selected)
        when hand
          selected + "\nYou Win!"
        when selected
          selected + "\nYou Lose!"
        else
          selected + "\nDraw!"
        end
      else
      end
    end
    
    # @return [String]
    def select_hand
      case predict
      when "グー"   then "パー"
      when "チョキ" then "グー"
      when "パー"   then "チョキ"
      end
    end

    private
    def predict
      @history.empty? ? %w(グー チョキ パー).sample : @history.sample
    end

    def judge(a, b)
      case a
      when "グー"
        if b == "チョキ"
          return a
        elsif b == "パー"
          return b
        else
          return nil
        end
      when "チョキ"
        if b == "パー"
          return a
        elsif b == "グー"
          return b
        else
          return nil
        end
      when "パー"
        if b == "グー"
          return a
        elsif b == "チョキ"
          return b
        else
          return nil
        end
      end
    end

  end
end
