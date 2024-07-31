##
# Scale
#
# A scale is a set of intervals built from a root note.
#
# +root+:: The root note of the scale.
# +intervals+:: The intervals of the scale, in half steps from the root.
#
class Scale
  attr_accessor :root, :intervals

  def initialize(root, intervals = [
    0, 2, 4, 5, 7, 9, 11
  ])
    @root = root
    @intervals = intervals
  end

  def to_s
    intervals.each do |distance|
      print root + distance
    end

    puts ''
  end
end # class Scale
