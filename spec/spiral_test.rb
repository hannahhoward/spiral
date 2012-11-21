# -*- coding: utf-8 -*-
require 'spec_helper'
require 'spiral'

describe Spiral do
  let :spiral do
    Spiral.new
  end
  
  describe 'perfect_square?' do
    let :perfect_squares do
      [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
    end
    let :non_perfect_squares do
      [2, 3, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15]
    end
    
    it "should return true if the square root is an integer" do
      perfect_squares.each do |n|
        spiral.perfect_square?(n).should be_true
      end
    end
    
    it "should return false if the square root is not an integer" do
      non_perfect_squares.each do |n|
        spiral.perfect_square?(n).should be_false
      end
    end
    
  end
  
end
