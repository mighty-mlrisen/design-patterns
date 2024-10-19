require './human.rb'

class Student < Human

    attr_reader :name, :surname, :patronymic, :phone, :telegram, :email

    def initialize(name: , surname: , patronymic: , id: nil, git: nil, phone: nil, telegram: nil,email: nil)
        self.name = name
        self.surname = surname
        self.patronymic = patronymic
        self.id = id
        self.git = git
        self.set_contacts(phone: phone, telegram: telegram, email: email)
    end

    def self.new_with_string(string)
        hash = self.parse(string)

        self.new(
            name: hash[:name],
            surname: hash[:surname],
            patronymic: hash[:patronymic],
            id: hash[:id].to_i,
            phone: hash[:phone],
            telegram: hash[:telegram],
            email: hash[:email],
            git: hash[:git]
        )
    end

    def self.valid_full_name?(name)
        /^[А-ЯЁA-Z][а-яёa-z]+(-[А-ЯЁA-Z][а-яёa-z]+)?$/.match?(name)
    end

    def to_s
        info = Array.new
        
        info << "id: #{@id ? @id : "not assigned"}"
        info << "name: #{@name}"
        info << "surname: #{@surname}"
        info << "patronymic: #{@patronymic}"
        info << "phone: #{@phone ? @phone : "not assigned"}"
        info << "telegram: #{@telegram ? @telegram : "not assigned"}"
        info << "email: #{@email ? @email : "not assigned"}"
        info << "git: #{@git ? @git : "not assigned"}"
        info << "-----------------------"
      
        info.join("\n") 
    end
      
    def get_info
        "#{self.get_full_name}, git: #{self.git ? self.git : "git not specified"}, #{self.get_contact}"
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

    def set_contacts(**contacts)
        if (!self.class.valid_phone?(contacts[:phone]))
            raise ArgumentError, "Invalid phone number format"
        end
        @phone = contacts[:phone] if contacts.key?(:phone)

        if (!self.class.valid_telegram?(contacts[:telegram]))
            raise ArgumentError, "Invalid telegram format"
        end
        @telegram = contacts[:telegram] if contacts.key?(:telegram)

        if (!self.class.valid_email?(contacts[:email]))
            raise ArgumentError, "Invalid email format"
        end
        @email = contacts[:email] if contacts.key?(:email)
    end

    def has_contacts?
        !self.phone.nil? || !self.telegram.nil? || !self.email.nil?
    end
end