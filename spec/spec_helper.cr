require "spec"
require "expect"
require "../src/crack/*"

def create_context(request)
  io = IO::Memory.new
  response = HTTP::Server::Response.new(io)
  context = HTTP::Server::Context.new(request, response)
  return io, context
end

class TestHandler < Crack::Handler::Base
  def call(context)
    if self.next != nil
      call_next context
    else
      context.response.print "All"
    end
  end
end
