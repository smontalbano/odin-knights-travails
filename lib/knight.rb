# frozen_string_literal: true

class Knight
  MOVES = [
    [1, 2], [-1, 2], [2, 1], [2, -1],
    [1, -2], [-1, -2], [-2, -1], [-2, 1]
  ].freeze

  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def knight_moves(start_node, end_node)
    return pretty_print(start_node) if start_node == end_node

    queue = [[start_node, [start_node]]]
    visited = Set.new

    until queue.empty?
      current, path = queue.shift

      MOVES.each do |move|
        x = current[0] + move[0]
        y = current[1] + move[1]
        pos = [x, y]

        next unless valid_move?(pos) && !visited.include?(pos)

        temp_path = path + [pos]
        return pretty_print(temp_path) if pos == end_node

        queue << [pos, temp_path]
        visited << pos
      end
    end
  end

  private

  def valid_move?(move)
    move[0].between?(0, 7) && move[1].between?(0, 7)
  end

  def pretty_print(path)
    puts "You made it in #{path.length - 1} moves!"
    path.each { |move| p move }
  end
end

lan = Knight.new

lan.knight_moves([4, 0], [7, 6])
