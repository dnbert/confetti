#!/usr/bin/env ruby

require 'sinatra'
require 'json'

set :logging, true
configure do
    enable :logging
    file = File.new(File.expand_path("../../logs/confetti.log", __FILE__),'a+')
    file.sync = true
    use Rack::CommonLogger, file
end

not_found do
    status 404
    "404, oh noes!"
end

# propose to only use POST method for all REST interactions
# propose all input and output must be sent as HTTP status code or JSON object

post '/:node_id/info' do
    # check against a token that is predefined for this node
    
    # check against :node_id value

    # we should be able to return, in json, everything related to the
    # status of this node. Status of this node would only be things like
    # what rules it has, when its last check in was and if the node is active 
    # (according to confetti). Things that should not be here are, failures from
    # checks and historical metrics/checks

    # return all information regarding this node
end

post '/:node_id/register' do
    # check against a token that is predefined for registrations

    # check against :node_id value

    # :node_id should be a unique identifier from the host system
    # a mac address or result from hostid should satisfy
    
    # return 200 response notifying our node that all was well and 
    # to wait for commands
end
