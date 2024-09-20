class Student

    attr_reader :name, :surname, :patronymic, :id, :phone, :telegram, :email, :git

    def initialize(name: , surname: , patronymic: , **fields)
        self.name = name
        self.surname = surname
        self.patronymic = patronymic
        self.id = fields[:id]
        self.phone = fields[:phone]
        self.telegram = fields[:telegram]
        self.email = fields[:email]
        self.git = fields[:git]
    end

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

    def self.valid_full_name?(name)
        name.nil? || /^[А-ЯЁA-Z][а-яёa-z]+(-[А-ЯЁA-Z][а-яёa-z]+)?$/.match?(name)
    end

    def print_info
        puts("id: #{@id ? @id : "not assigned"}")
        puts("name: #{@name}")
        puts("surname: #{@surname}")
        puts("patronymic: #{@patronymic}")
        puts("phone: #{@phone ? @phone : "not assigned"}")
        puts("telegram: #{@telegram ? @telegram : "not assigned"}")
        puts("email: #{@email ? @email : "not assigned"}")
        puts("git: #{@git ? @git : "not assigned"}")
        puts("-------------------------------")
    end

    def phone=(phone)
        if (!self.class.valid_phone?(phone))
            raise ArgumentError, "Invalid phone number format"
        end
        @phone = phone
    end

    def telegram=(telegram)
        if (!self.class.valid_telegram?(telegram))
            raise ArgumentError, "Invalid telegram format"
        end
        @telegram = telegram
    end

    def email=(email)
        if (!self.class.valid_email?(email))
            raise ArgumentError, "Invalid email format"
        end
        @email = email
    end

    def git=(git)
        if (!self.class.valid_git?(git))
            raise ArgumentError, "Invalid git format"
        end
        @git = git
    end

    def name=(name)
        if (!self.class.valid_full_name?(name))
            raise ArgumentError, "Invalid name format"
        end
        @name = name
    end

    def surname=(surname)
        if (!self.class.valid_full_name?(surname))
            raise ArgumentError, "Invalid surname format"
        end
        @surname = surname
    end

    def patronymic=(patronymic)
        if (!self.class.valid_full_name?(patronymic))
            raise ArgumentError, "Invalid patronymic format"
        end
        @patronymic = patronymic
    end

    def id=(id)
        if (!self.class.valid_id?(id))
            raise ArgumentError, "Invalid id format"
        end
        @id = id
    end

    # проверка наличия git и контактов
    def validate
        self.has_git? && self.has_contacts?
    end

    def has_git?
        !self.git.nil?
    end

    def has_contacts?
        !self.phone.nil? || !self.telegram.nil? || !self.email.nil?
    end
end