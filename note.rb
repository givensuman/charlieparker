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
