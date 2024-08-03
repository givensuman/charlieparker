require_relative 'note'

##
# Scale
#
# A scale is a set of intervals built from a root note.
#
# +root+:: The root note of the scale.
# +intervals+:: The intervals of the scale, in half steps from the root.
#
class Scale
  attr_accessor :root, :intervals, :opts

  def initialize(root = Note.new('C'), intervals = ScaleIntervals.get_intervals(:major), opts = {
    prefer_sharps: false,
    prefer_flats: false
  })
    @root = root
    @intervals = intervals
    @opts = opts
  end

  def to_s
    intervals.each do |interval|
      note = root.increase_interval(interval)

      if @opts[:prefer_sharps] && note.flat?
        note = note.switch_accidental
      elsif @opts[:prefer_flats] && note.sharp?
        note = note.switch_accidental
      end

      print "#{note} "
    end

    puts ''
  end
end

##
# ScaleIntervals
#
# A representation of the intervals of a given scale.
#
module ScaleIntervals
  @@intervals = {
    major: [0, 2, 4, 5, 7, 9, 11],
    minor: [0, 2, 3, 5, 7, 8, 10],
    dorian: [0, 2, 3, 5, 7, 9, 10],
    phrygian: [0, 1, 3, 5, 7, 8, 10],
    lydian: [0, 2, 4, 6, 7, 9, 11],
    mixolydian: [0, 2, 4, 5, 7, 9, 10],
    locrian: [0, 1, 3, 5, 6, 8, 10],
    harmonic_minor: [0, 2, 3, 5, 7, 8, 11],
    harmonic_major: [0, 2, 4, 5, 7, 8, 11],
    melodic_minor: [0, 2, 3, 5, 7, 9, 11],
    melodic_major: [0, 2, 4, 5, 7, 8, 10],
    diminished: [0, 1, 3, 4, 6, 7, 9, 10],
    whole_tone: [0, 2, 4, 6, 8, 10],
    chromatic: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  }.freeze

  def self.get_intervals(scale_name)
    @@intervals[scale_name]
  end
end

scale = Scale.new(Note.new('C'), ScaleIntervals.get_intervals(:minor), { prefer_flats: true })
print scale
