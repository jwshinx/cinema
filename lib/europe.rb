module Europe
  module Currency 
    def in_euros(dollar_amount_attr)
      ((self.send("#{dollar_amount_attr}")) * 0.75).to_f
    end                 
  end
end