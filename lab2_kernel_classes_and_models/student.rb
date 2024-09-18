class Student

    def initialize(name, surname, patronymic, id=nil, phone=nil, telegram=nil, email=nil, git=nil)
        self.id = id
        self.name = name
        self.surname = surname
        self.patronymic = patronymic
        self.phone = phone
        self.telegram = telegram
        self.email = email
        self.git = git
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

    def name
        @name
    end

    def name=(name)
        @name = name
    end

    def surname
        @surname
    end

    def surname=(surname)
        @surname = surname
    end

    def patronymic
        @patronymic
    end

    def patronymic=(patronymic)
        @patronymic = patronymic
    end

    def id
        @id
    end

    def id=(id)
        @id = id
    end

    def phone
        @phone
    end

    def phone=(phone)
        @phone = phone
    end

    def telegram
        @telegram
    end

    def telegram=(telegram)
        @telegram = telegram
    end

    def email
        @email
    end

    def email=(email)
        @email = email
    end

    def git
        @git
    end

    def git=(git)
        @git = git
    end

end