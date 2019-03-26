require_relative "time_formats"

class App
  def call(env)
    @request = Rack::Request.new(env)
    if @request.path_info == "/time" && @request.get?
      time_response(@request.params["format"])
    else
      set_response(404, "URL - #{@request.path_info} not found")
    end
  end

private
  def set_response(status, text)
    @response = Rack::Response.new
    @response.status = status
    @response.headers["Content-Type"] = "text/plain"
    @response.write "#{text}"
    @response.finish
  end

  def time_response(format_string)
    time_format = TimeFormats.new(format_string)
    if time_format.unknown_formats.empty?
      set_response(200, "===============#{time_format.format_date_time}============")
    else
      set_response(400, "Unknown formats #{time_format.unknown_formats}")
    end
  end
end
