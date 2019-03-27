class TimeFormats
  ALLOWED_FORMATS ={
                year: "%Y",
                month: "%m",
                day: "%d",
                hour: "%H",
                minute: "%M",
                seconds: "%S"
                }.freeze

  attr_reader :unknown_formats
  def initialize(formats)
    @formats = formats
  end

  def check_formats
    @request_formats = @formats.split(",")
    @unknown_formats = []
    @formats = []

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
