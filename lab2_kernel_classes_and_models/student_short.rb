require './student.rb'
require './human.rb'

class Student_short < Human
  attr_reader :full_name, :contact
  private_class_method :new

  def initialize(full_name: , git: , contact: ,id: nil)
      self.id = id
      self.full_name = full_name
      self.git = git
      self.contact = contact
  end

  def self.init_with_student(student)
      self.new(id: student.id, full_name: student.get_full_name.slice(11..-1), git: student.git, contact: student.get_contact)
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

      self.new(id: id,full_name: hash[:full_name], git: hash[:git], contact: contact)
  end

  def has_contacts?
    !self.contact.nil?
  end 

  private

  def full_name=(full_name)
      if (!self.class.valid_full_name?(full_name))
          raise ArgumentError, "Invalid full name format"
      end
      @full_name = full_name
  end

  def contact=(contact)
      if (contact.include?("phone:") && !self.class.valid_phone?(contact.slice(7..-1)))
          raise ArgumentError, "Invalid phone number format"
      elsif (contact.include?("telegram:") && !self.class.valid_telegram?(contact.slice(10..-1)))
          raise ArgumentError, "Invalid telegram format"
      elsif (contact.include?("email:") && !self.class.valid_email?(contact.slice(7..-1)))
          raise ArgumentError, "Invalid email format"
      end
      @contact = contact
  end

  def self.valid_full_name?(full_name)
      /^[А-ЯЁA-Z][а-яёa-z]+(-[А-ЯЁA-Z][а-яёa-z]+)?\s[А-ЯЁA-Z]\.[А-ЯЁA-Z]\.$/.match?(full_name)
  end
end