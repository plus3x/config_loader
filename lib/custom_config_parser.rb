# frozen_string_literal: true

module CustomConfigParser
  def self.parse(config_file)
    config_file.each_line.reduce({}) do |memo, line|
      next memo if line.blank? || line.start_with?('#')

      property, value = line.split(/ {0,1}\= {0,1}/)

      value =
        case value.strip!
        when /\d+\.\d+/ then value.to_f
        when /\d+/ then value.to_i
        when /on|yes|true/i then true
        when /off|no|false/i then false
        else
          value
        end

      memo.update property => value
    end
  end
end
