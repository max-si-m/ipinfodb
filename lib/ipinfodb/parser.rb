require "json"

module Ipinfodb
  class API
    module Parser
    	class InvalidParamsError < ArgumentError; end

      def parse_response(response)        
        result = convert_keys response.parsed_response
      	raise InvalidParamsError.new(result[:status_message]) if result[:status_code] == "ERROR"
      	result      	
      end

      private
		    def convert_keys(response)		    	
		    	response.inject({}) {|hsh, (key,value)| hsh[key.to_s.gsub(/[A-Z]/){|s| '_' + s.downcase}.gsub(/^_/, '').to_sym] = value; hsh}
		    end		      		      
    end
  end
end