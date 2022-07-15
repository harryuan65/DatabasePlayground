require "logger"

# use "include" to create a global memoized logger
# then #logger can be called anywhere
module Logging
  def logger
    Logging.logger
  end

  def self.logger
    @logger ||= (puts(">>>>>>>>>[init logger]") || Logger.new(STDOUT))
  end
end
