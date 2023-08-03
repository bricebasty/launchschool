status = ['awake', 'tired'].sample
var = if status == 'awake'
        "Be Productive"
      else
        "Go to Sleep"
      end

p var