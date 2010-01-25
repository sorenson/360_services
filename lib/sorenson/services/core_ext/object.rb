class Object
  # Converts an object into a string suitable for use as a URL query string, using the given <tt>key</tt> as the
  # param name.
  #
  # Note: This method is defined as a default implementation for all Objects for Hash#to_query to work.
  def to_query(key)
    require 'cgi' unless defined?(CGI) && defined?(CGI::escape)
    "#{CGI.escape(key.to_s).gsub(/%(5B|5D)/n) { [$1].pack('H*') }}=#{CGI.escape(to_param.to_s)}"
  end

  # Alias of <tt>to_s</tt>.
  def to_param
    to_s
  end

end