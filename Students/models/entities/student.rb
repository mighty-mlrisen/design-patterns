require './models/entities/human.rb'
require 'date'


class Student < Human

    include Comparable

    attr_reader :name, :surname, :patronymic, :phone, :telegram, :email, :birthdate

    def initialize(name: , surname: , patronymic: , id: nil, git: nil, phone: nil, telegram: nil,email: nil, birthdate: nil)
        self.name = name
        self.surname = surname
        self.patronymic = patronymic
        self.id = id
        self.git = git
        self.birthdate = birthdate
        self.set_contacts(phone: phone, telegram: telegram, email: email)
    end

    def self.init_with_string(string)
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

    def <=>(other)
        return nil unless other.is_a?(Student)
        return 0 if (self.birthdate.nil? && other.birthdate.nil?)

	    return 1 if self.birthdate.nil?

		return -1 if other.birthdate.nil?

		self.birthdate <=> other.birthdate
    end

    def self.valid_full_name?(name)
        /^[А-ЯЁA-Z][а-яёa-z]+(-[А-ЯЁA-Z][а-яёa-z]+)?$/.match?(name)
    end

    def to_s
        "#{"-------------------\nID: #{self.id}\n" unless self.id.nil?}Surname: #{ self.surname }\nName: #{ self.name }\nPatronymic: #{ self.patronymic }\n#{"Birthdate: #{ self.birthdate }\n" unless self.birthdate.nil?}#{"Phone Number: #{ self.phone }\n" unless self.phone.nil?}#{"Telegram: #{ self.telegram }\n" unless self.telegram.nil?}#{"Email: #{ self.email }\n" unless self.email.nil?}#{"Git: #{ self.git }\n" unless self.git.nil?}-------------------"
    end

    def to_h
        { id: self.id, surname: self.surname, name: self.name, patronymic: self.patronymic, birthdate: self.birthdate, telegram: self.telegram, email: self.email, phone: self.phone, git: self.git }
    end
      
    def get_info
        "#{self.get_full_name}, git: #{self.git}, #{self.get_contact}"
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

    def birthdate=(birthdate)
        if (birthdate.is_a?(Date) || birthdate.nil?)
            @birthdate = birthdate
          elsif birthdate.is_a?(String) 
             @birthdate = Date.parse(birthdate)
          else
            raise ArgumentError, "Invalid birthdate format"
          end
    end

    def id=(id)
        if (!self.class.valid_id?(id))
            raise ArgumentError, "Invalid id format"
        end
        @id = id
    end

    def self.valid_id?(id)
        id.nil? || id.is_a?(Integer) || /^\d+$/.match?(id.to_s)
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