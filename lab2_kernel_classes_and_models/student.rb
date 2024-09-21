class Student

    attr_reader :name, :surname, :patronymic, :id, :phone, :telegram, :email, :git

    def initialize(name: , surname: , patronymic: , **fields)
        self.name = name
        self.surname = surname
        self.patronymic = patronymic
        self.id = fields[:id]
        self.git = fields[:git]
        self.set_contacts(**fields)
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
        /^[А-ЯЁA-Z][а-яёa-z]+(-[А-ЯЁA-Z][а-яёa-z]+)?$/.match?(name)
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

    def get_info
        "#{self.get_full_name}, git: #{self.git ? self.git : "git not specified"}, #{self.get_contact}"
    end

    def get_full_name
        "full name: #{self.surname} #{self.name[0]}.#{self.patronymic[0]}."
    end

    def get_contact
        if (!self.phone.nil?)
            "phone: #{self.phone}"
        elsif (!self.telegram.nil?)
            "telegram: #{self.telegram}"
        elsif (!self.email.nil?)
            "email: #{self.email}"
        else
            "contacts not specified"
        end
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


class Student_short
    attr_reader :id, :full_name, :git, :contact
    private_class_method :new

    def initialize(id, full_name, git, contact)
        self.id = id
        self.full_name = full_name
        self.git = git
        self.contact = contact
    end

    def self.init_with_student(student)
        self.new(student.id,student.get_full_name.slice(11..-1),student.git,student.get_contact)
    end

    def self.init_with_string(id, string)
        hash = self.parse(string)
        contact = nil
        if (hash[:phone])
            contact = "phone: #{hash[:phone]}"
        elsif (hash[:telegram])
            contact = "telegram: #{hash[:telegram]}"
        elsif (hash[:email])
            contact = "email: #{hash[:email]}"
        end

        self.new(id,hash[:full_name],hash[:git],contact)
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

    private

    def id=(id)
        if (!Student.valid_id?(id))
            raise ArgumentError, "Invalid id format"
        end
        @id = id
    end

    def full_name=(full_name)
        if (!self.class.valid_full_name?(full_name))
            raise ArgumentError, "Invalid full name format"
        end
        @full_name = full_name
    end

    def git=(git)
        if (!Student.valid_git?(git))
            raise ArgumentError, "Invalid git format"
        end
        @git = git
    end

    def contact=(contact)
        if (contact.include?("phone:") && !Student.valid_phone?(contact.slice(7..-1)))
            raise ArgumentError, "Invalid phone number format"
        elsif (contact.include?("telegram:") && !Student.valid_telegram?(contact.slice(10..-1)))
            raise ArgumentError, "Invalid telegram format"
        elsif (contact.include?("email:") && !Student.valid_email?(contact.slice(7..-1)))
            raise ArgumentError, "Invalid email format"
        end
        @contact = contact
    end

    def self.valid_full_name?(full_name)
        /^[А-ЯЁA-Z][а-яёa-z]+(-[А-ЯЁA-Z][а-яёa-z]+)?\s[А-ЯЁA-Z]\.[А-ЯЁA-Z]\.$/.match?(full_name)
    end
end


