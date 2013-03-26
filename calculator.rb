Shoes.app :title => "My Amazing Calculator", :width => 240, :height => 240 do
  stack :margin => 50 do #changed to fifty, buttons open up in rows of three
    @output = edit_line

    flow do
      %w(0 1 2 3 4 5 6 7 8 9 + / * -).each do |op|      
        button op do         
          append op
        end
      end

      button "c" do #added this clearing button
        @output.text = ""
        @input = ""
      end
      
      button "=" do
        eval_expression
      end
    end
    
  end

  
  # Stick a string on the end of our input
  #
  def append(s)
    if @input.nil?
      @input = ""
    end
    @input += s
    @output.text = @input
  end
  
  # Evaluate the input we've got so far
  #
  def eval_expression
    @input = eval(@input).to_s #eval is a method given to us by ruby, even if the numbers are in a string
    @output.text = @input # when you have three different types of buttons, an equals, a cancel, numbers, then it may work to have a case 
  end
  
end
