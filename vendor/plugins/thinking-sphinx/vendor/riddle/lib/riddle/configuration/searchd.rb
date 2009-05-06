module Riddle
  class Configuration
    class Searchd < Riddle::Configuration::Section
      self.settings = [:listen, :address, :port, :log, :query_log,
        :read_timeout, :client_timeout, :max_children, :pid_file, :max_matches,
        :seamless_rotate, :preopen_indexes, :unlink_old, :attr_flush_period,
        :ondisk_dict_default, :max_packet_size, :mva_updates_pool,
        :crash_log_path, :max_filters, :max_filter_values]
      
      attr_accessor *self.settings
            
      def render
        raise ConfigurationError unless valid?
        
        (
          ["searchd", "{"] +
          settings_body +
          ["}", ""]
        ).join("\n")
      end
      
      def valid?
        set_listen
        clear_deprecated
        
        !( @listen.nil? || @pid_file.nil? )
      end
      
      private
      
      def set_listen
        return unless @listen.nil?
        
        @listen = @port.to_s if @port && @address.nil?
        @listen = "#{@address}:#{@port}" if @address && @port
      end
      
      def clear_deprecated
        return if @listen.nil?
        
        @address  = nil
        @port     = nil
      end
    end
  end
end