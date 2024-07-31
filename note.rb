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
    @name = name
    @opts = opts
  end

  def sharp?
    @opts[:is_sharp]
  end

  def flat?
    @opts[:is_flat]
  end

  def to_s
    "#{name}#{sharp? ? '#' : nil}#{flat? ? 'b' : nil}"
  end
end # class Note
