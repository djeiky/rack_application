class TimeFormats
  ALLOWED_FORMATS ={
                year: "%Y",
                month: "%m",
                day: "%d",
                hour: "%H",
                minute: "%M",
                seconds: "%S"
                }.freeze

  attr_accessor :unknown_formats
  attr_accessor :formats
  def initialize(params_string)
    @request_formats = params_string.split(",")
    @unknown_formats = []
    @formats = []
  end

  def check_formats
    @request_formats.each do |f|
      if ALLOWED_FORMATS[f.to_sym]
        @formats << ALLOWED_FORMATS[f.to_sym]
      else
        @unknown_formats << f
      end
    end
  end

  def format_date_time
    Time.now.strftime(@formats.join("-"))
  end
end
