module PagesHelper

  def reduce_name(name)
    full_name = name.split.select {|w| w.to_i == 0 }
    mult = name.split.select {|w| w.to_i > 0}

    [full_name.first, full_name, mult]
  end
  
end
