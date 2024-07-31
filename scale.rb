class Scale
  attr_accessor :root, :notes

  def initialize(root, notes = [])
    @root = root
    @notes = notes
  end

  def to_s
    notes.each do |note|
      print note
    end

    puts ''
  end
end # class Scale
