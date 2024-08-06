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
        accidental < 0
    end

    def to_s
        "#{name}#{sharp? ? "#" * accidental : nil}#{flat? ? "♭" * accidental.abs : nil}"
    end
end

note = Note.new("C", -2)
puts note