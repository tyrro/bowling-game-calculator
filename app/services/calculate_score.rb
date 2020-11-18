class CalculateScore
  def self.call(roll_sequence)
    new(roll_sequence).call
  end

  def initialize(roll_sequence)
    @roll_sequence = roll_sequence.presence || ''
    @bonus_balls = 0
    @knocked_pins = []
  end

  def call
    calculate_bonus_balls
    save_knocked_pins_as_scores
    calculate_total_score
  end

  private

  def calculate_bonus_balls
    roll_sequence_length = @roll_sequence.length

    @bonus_balls = if @roll_sequence[roll_sequence_length - 3] == 'X'
                     2
                   elsif @roll_sequence[roll_sequence_length - 2] == '/'
                     1
                   else
                     0
                   end
  end

  def save_knocked_pins_as_scores
    @roll_sequence.each_char.with_index do |throw, index|
      case throw
      when 'X'
        @knocked_pins.push 10
      when '/'
        @knocked_pins.push(10 - @roll_sequence[index - 1].to_i)
      when '-'
        @knocked_pins.push 0
      else
        @knocked_pins.push(throw.to_i)
      end
    end
  end

  def calculate_total_score
    total_score = 0
    calculable_roll_sequence = @roll_sequence.slice(0, @roll_sequence.length - @bonus_balls)

    calculable_roll_sequence.each_char.with_index do |throw, index|
      total_score += @knocked_pins[index]

      case throw
      when '/'
        total_score += @knocked_pins[index + 1]
      when 'X'
        total_score += @knocked_pins[index + 1] + @knocked_pins[index + 2]
      end
    end
    total_score
  end
end
