class Display
  def generate_display(board)
    template = my_template(board)
    board_binding = binding
    board_binding.local_variable_set(:board, board)
    ERB.new(template).result(board_binding)
  end

  def my_template(page)
    path = File.expand_path("view/play.html.erb")
    File.read(path)
  end
end
