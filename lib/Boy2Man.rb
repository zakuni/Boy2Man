#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require "Boy2Man/version"

module Boy2Man
  
  def self.play
    puts %w(グー チョキ パー).sample while gets != "\n"
  end
end
