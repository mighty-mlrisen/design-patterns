class Students_list_strategy
    
    def read(file_path)
        raise NotImplementedError, 'Subclass must implement this method'
    end

    def write(file_path, students)
        raise NotImplementedError, 'Subclass must implement this method'
    end
end