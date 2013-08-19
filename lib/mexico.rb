module Mexico
  module Currency 
    def in_pesos(dollar_amount_attr)
      ((self.send("#{dollar_amount_attr}")) * 13).to_f
    end                 
  end
end