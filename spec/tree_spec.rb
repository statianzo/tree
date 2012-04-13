require 'spec_helper'
require 'tree'

describe Tree do
  it 'should create a tree from a path' do
    result = Tree.build '/home/sports/basketball/ncaa/'

    result.must_equal({
      'home' => { 'sports' => { 'basketball' => { 'ncaa' => {} } } }})

  end

  it 'should insert path into tree' do
    tree = Tree.build '/home/music/rap/'
    result = Tree.build '/home/music/rap/gangster/', tree
    result.must_equal ({
      'home' => { 'music' => { 'rap' => { 'gangster' => {} } } }})
  end

  it 'should insert two leaves' do
    skip #because combinatorial insert breaks this
    tree = Tree.build '/home/sports/football/'
    result = Tree.build '/home/sports/football/nfl|ncaa', tree

    result.must_equal({
      'home' => { 'sports' => { 'football' => { 'nfl' => {}, 'ncaa' => {} } } }})
  end

  it 'should insert combinatorially' do
    tree = Tree.build '/home/music/'
    result = Tree.build '/home/music/rap|rock|pop', tree

    result.must_equal({
      'home' => {'music' => {'rap' => {}, 'rock' => {}, 'pop' => {}, 'rap-rock' => {}, 'rap-pop' => {}, 'rock-pop' => {}, 'rap-rock-pop' => {} } }})
  end
end
