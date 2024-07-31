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
    notes = @opts[:is_sharp] ? NOTES_W_SHARPS : NOTES_W_FLATS
  end

  def to_s
    "#{name}#{sharp? ? '#' : nil}#{flat? ? 'b' : nil}"
  end
end # class Note

NOTES_W_FLATS = [ 
  Note.new('A'),
  Note.new('B', { :is_flat }),
  Note.new('B'),
  Note.new('C'),
  Note.new('D', { :is_flat }),
  Note.new('D'),
  Note.new('E', { :is_flat }),
  Note.new('E'),
  Note.new('F'),
  Note.new('G', { :is_flat }),
  Note.new('G'),
  Note.new('A', { :is_flat }),
]

NOTES_W_SHARPS = [ 
  Note.new('A'),
  Note.new('A', { :is_sharp }),
  Note.new('B'),
  Note.new('C'),
  Note.new('C', { :is_sharp }),
  Note.new('D'),
  Note.new('D', { :is_sharp }),
  Note.new('E'),
  Note.new('F'),
  Note.new('F', { :is_sharp }),
  Note.new('G'),
  Note.new('G', { :is_sharp }),
]

note = Note.new("C")
note.increase_interval 6