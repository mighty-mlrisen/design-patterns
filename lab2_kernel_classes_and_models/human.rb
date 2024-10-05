class Human
    attr_reader :id, :git

    protected

    def self.valid_id?(id)
        id.nil? || id.is_a?(Integer) || /^\d+$/.match?(id.to_s)
    end
    
    def self.valid_phone?(phone)
        phone.nil? || /^\+7|8[\s-]?(?:\(?\d{3}\)?[\s-]?)\d{3}[\s-]?\d{2}[\s-]?\d{2}$/.match?(phone)
    end

    def self.valid_telegram?(telegram)
        telegram.nil? || /^\@[a-zA-Z0-9_]{5,}$/.match?(telegram)
    end

    def self.valid_email?(email)
        email.nil? || /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.match?(email)
    end

    def self.valid_git?(git)
        git.nil? || %r{^https?://github\.com/[a-zA-Z0-9_-]+$}.match?(git)
    end

    def self.parse(string)
        result = {}
    
        string.split(', ').each do |part|
            key_value = part.split(': ')
            key = key_value[0].strip.to_sym 
            value = key_value[1].strip if key_value[1] 
    
            result[key] = value if key && value
        end
    
        result
    end

    def git=(git)
        if (!self.class.valid_git?(git))
            raise ArgumentError, "Invalid git format"
        end
        @git = git
    end

    def id=(id)
        if (!self.class.valid_id?(id))
            raise ArgumentError, "Invalid id format"
        end
        @id = id
    end
end