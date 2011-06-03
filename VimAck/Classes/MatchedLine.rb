#
#  MatchedLine.rb
#  Waldo
#
#  Copyright 2011 Majd Taby. All rights reserved.
#

MatchedLine = Struct.new(:filename, :line_number, :matched_line, :matched_ranges, :query)
