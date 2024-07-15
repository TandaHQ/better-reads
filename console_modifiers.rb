env_colour = case Rails.env
             when 'development'
               %i[MAGENTA BOLD]
             when 'test'
               %i[GREEN BOLD]
             else # live environments
               %i[RED BOLD]
             end

env_str = IRB::Color.colorize(Rails.env, env_colour)

prompt_prefix = "(#{env_str}) :%03n"
IRB.conf[:PROMPT] ||= {}
IRB.conf[:PROMPT][:RAILS_APP] = {
  PROMPT_I: "#{prompt_prefix} > ",
  PROMPT_S: "#{prompt_prefix} > ",
  PROMPT_C: "#{prompt_prefix} > ",
  RETURN: "==> %s\n",
  AUTO_INDENT: true
}

IRB.conf[:PROMPT_MODE] = :RAILS_APP

IRB.conf[:USE_AUTOCOMPLETE] = false