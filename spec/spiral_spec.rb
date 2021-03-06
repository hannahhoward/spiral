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
  
  describe 'generate_spiral_incrementally' do
    let :test_matrices do
      {
        1   => [[1]],
        4   => [[4,3],[1,2]],
        9   => [[5,4,3],[6,1,2],[7,8,9]],
        16  => [[16,15,14,13],[5,4,3,12],[6,1,2,11],[7,8,9,10]],
        36  => [[36,35,34,33,32,31],
                [17,16,15,14,13,30],
                [18,5,4,3,12,29],
                [19,6,1,2,11,28],
                [20,7,8,9,10,27],
                [21,22,23,24,25,26]]
      }
    end
    
    it "should generate a matrix with elements 1..n in spiral order" do
      test_matrices.each do |n, matrix|
        spiral.generate_spiral_incrementally(n).should eq(matrix)
      end
    end
    
  end
  
  describe 'generate' do
    
    it "should instantiate a matrix if given a perfect square" do
      spiral.generate(9)
      spiral.matrix.should_not be_nil
    end
    
    it "should not instantiate a matrix if given a number that is not a perfect square" do
      spiral.generate(5)
      spiral.matrix.should be_nil
    end
    
  end
  
  describe 'print' do
    let :output do
      ["16 15 14 13", "5  4  3  12", "6  1  2  11","7  8  9  10"]
    end
    
    it "it should print out matrix with evenly spaced columns if given a perfect square" do
      output.each do |line|
        STDOUT.should_receive(:puts).with(line)
      end
      spiral.generate(16)
      spiral.print
    end
    
    it "it should print an error message if not given a perfect square" do
      STDOUT.should_receive(:puts).with("Please give a number that is a perfect square")
      spiral.generate(7)
      spiral.print
    end
    
  end
      
end
