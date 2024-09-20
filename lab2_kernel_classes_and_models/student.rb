class Student

    attr_accessor :id, :name, :surname, :patronymic, :phone, :telegram, :email, :git

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