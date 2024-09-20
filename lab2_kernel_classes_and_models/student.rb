class Student

    attr_reader :phone
    attr_accessor :id, :name, :surname, :patronymic, :telegram, :email, :git

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

    def self.check_phone_number?(phone)
        phone.nil? || /^\+7|8[\s-]?(?:\(?\d{3}\)?[\s-]?)\d{3}[\s-]?\d{2}[\s-]?\d{2}$/.match?(phone)
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
        if (!self.class.check_phone_number?(phone))
            raise ArgumentError, "Invalid phone number format"
        end
        @phone = phone
    end
end