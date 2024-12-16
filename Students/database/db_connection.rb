require 'pg'

class DB_connection

    private_class_method :new
    
    def initialize(db_config)
      raise "The database configuration is missing" unless db_config
      self.client = PG.connect(db_config)
    end

    def self.instance(db_config = nil)
        @instance ||= new(db_config)
    end

    def query(query, params=[])
        self.client.exec_params(query,params)
    end

    def close
        self.client.close
    end

    private
    attr_accessor :client

    @instance = nil
end