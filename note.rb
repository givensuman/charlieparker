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
  attr_accessor :name, :accidental

  def initialize(name, accidental = 0)
    @name = name.upcase
    @accidental = accidental
  end

  def sharp?
    accidental > 0
  end

  def flat?
    
  end

  def set_sharp(is_sharp)
    @opts[:is_sharp] = is_sharp
  end

  def set_flat(is_flat)
    @opts[:is_flat] = is_flat
  end

  def increase_interval(interval)
    return self if interval.zero?

    notes = TwelveTone.get_notes(@opts)
    index_of_note = notes.index { |note| note.name == name }

    interval %= 12
    index_of_new_note = (index_of_note + interval) % 12

    notes[index_of_new_note]
  end

  def switch_accidental
    return self if !sharp? && !flat?

    note = Note.new(@name, @opts)

    if sharp?
      note = increase_interval(2)
      note.set_sharp(false)
      note.set_flat(true)
    else
      note = increase_interval(-2)
      note.set_sharp(true)
      note.set_flat(false)
    end

    note
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
  @@notes_w_flats = [
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

  @@notes_w_sharps = [
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
    opts[:is_flat] ? @@notes_w_flats : @@notes_w_sharps # Prefers sharps
  end
end

