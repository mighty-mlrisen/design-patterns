class Student

    attr_accessor :id, :name, :surname, :patronymic, :phone, :telegram, :email, :git 

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

end