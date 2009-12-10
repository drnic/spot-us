def path_to(page_name)
  case page_name
  
  when /the home\s?page/i
    root_path
  when /the edit myspot::donation_amounts page/
    edit_myspot_donations_amounts_path
  when /the new pitch page/
    new_pitch_path
  else
    raise "Can't find mapping from \"#{page_name}\" to a path."
  end
end