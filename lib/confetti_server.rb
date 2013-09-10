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

post '/:node_id/update' do
    # check against a token that is predefined for this node

    # check against :node_id value

    # the update method should update the metric data for this specific node id
    # we need to identify what to do to prevent from consecutive updates whether
    # this be inside of ES itself or middleware between Confetti->ES such as
    # RabbitMQ. We should expect to see a "value" of some sort, either boolean
    # or long floating integer. UP or DOWN should be indicated by TRUE or FALSE boolean
    # values while returns for jobs such as "uptime" should be long floats
    
    # return 200 or 500 depending on if the update was successfully delivered
    # if there is a 500 error we need to update the node status. We may want to
    # only have :node_id/updates sent through a MQ and post other requests directly
    # to ES. For a 500 error we may want more options to indicate how to report a failure,
    # via email or XMPP notifications
end

post '/:node_id/rules' do
    # check against a token that is predefined for this node
    
    # check against :node_id value

    # the rules method should be returning a json object that contains a unique list of
    # content to run on the machine. the list of rules to run should be in a nested json object
    # living in ES. The most interesting bit is how we define rules. Should rules be YAML objects
    # that have predefined actions such as uptime? Or should rules be pure language files? In any case
    # these should be defined inside of a nested json object inside of ES node_id->rules->my_rule->command
    # recreate a new json object with the commands to run explicitly
    
    # return the json object
end

post '/:node_id/register' do
    # check against a token that is predefined for registrations

    # check against :node_id value

    # :node_id should be a unique identifier from the host system
    # a mac address or result from hostid should satisfy
    
    # return 200 response notifying our node that all was well and 
    # to wait for commands
end
