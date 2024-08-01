##
# Note
#
# A note is a pitch with a sharp or flat modifier.
#
# +name+:: The name of the note.
# +opts+:: Options for the note.
#   +is_sharp+:: Is the note a sharp note?
#   +is_flat+:: Is the note a flat note?
#
class Note
  attr_accessor :name, :opts

  def initialize(name, opts = { is_sharp: false, is_flat: false })
    @name = name.upcase
    @opts = opts
  end

  def sharp?
    @opts[:is_sharp]
  end

  def flat?
    @opts[:is_flat]
  end

  def increase_interval(interval)
    return self if interval.zero?

    notes = TwelveTone.get_notes(@opts)
    index_of_note = notes.index { |note| note.name == name }

    interval %= 12

    puts notes[index_of_note + interval + 1]
  end

  def to_s
    "#{name}#{sharp? ? '#' : nil}#{flat? ? 'b' : nil}"
  end
end

##
# TwelveTone
#
# A representation of the twelve tone system of Western music.
# Use `get_notes` to get those tones as an array of notes.
#
module TwelveTone
  @notes_w_flats = [
    Note.new('A'),
    Note.new('B', { is_flat: true }),
    Note.new('B'),
    Note.new('C'),
    Note.new('D', { is_flat: true }),
    Note.new('D'),
    Note.new('E', { is_flat: true }),
    Note.new('E'),
    Note.new('F'),
    Note.new('G', { is_flat: true }),
    Note.new('G'),
    Note.new('A', { is_flat: true })
  ].freeze

  @notes_w_sharps = [
    Note.new('A'),
    Note.new('A', { is_sharp: true }),
    Note.new('B'),
    Note.new('C'),
    Note.new('C', { is_sharp: true }),
    Note.new('D'),
    Note.new('D', { is_sharp: true }),
    Note.new('E'),
    Note.new('F'),
    Note.new('F', { is_sharp: true }),
    Note.new('G'),
    Note.new('G', { is_sharp: true })
  ].freeze

  ##
  # Get the notes in the twelve tone system.
  #
  # +opts+:: Options for the notes.
  #   +is_sharp+:: Is the note a sharp note?
  #   +is_flat+:: Is the note a flat note?
  #
  # Returns an array of notes.
  #
  def self.get_notes(opts = { is_sharp: false, is_flat: false })
    opts[:is_sharp] ? @notes_w_sharps : @notes_w_flats # Prefers flats
  end
end

