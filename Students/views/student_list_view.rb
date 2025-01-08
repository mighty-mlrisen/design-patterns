require 'fox16'
require './models/students_list/students_list_DB.rb'
require './models/students_list/students_list.rb'
require './models/data_list/data_list.rb'
require './models/students_list_strategy/students_list_strategy_json.rb'
require './models/students_list_strategy/students_list_strategy_yaml.rb'
require './controllers/student_list_controller.rb'
include Fox


class StudentListView < FXMainWindow

    def initialize(app)
        super(app, "Student List", width: 1080, height: 505)

        self.controller = Student_list_controller.new(self)

        self.filters = {}
        self.current_page = 1
        self.items_per_page = 21
        self.total_pages = 0

        # Главный контейнер
        main_frame = FXHorizontalFrame.new(self, LAYOUT_FILL_X | LAYOUT_FILL_Y)

        # Область фильтрации
        filter_frame = FXVerticalFrame.new(main_frame, LAYOUT_FIX_WIDTH, width: 250, padding: 10)
        setup_filter_area(filter_frame)

        # Таблица
        table_frame = FXVerticalFrame.new(main_frame, LAYOUT_FILL_X | LAYOUT_FILL_Y, padding: 10)
        setup_table_area(table_frame)

        # Область управления
        control_frame = FXVerticalFrame.new(main_frame, LAYOUT_FIX_WIDTH, width: 150, padding: 10)
        setup_control_area(control_frame)

        refresh_data

    end

    def refresh_data
        self.current_page = 1
        self.controller.refresh_data
    end

    def set_table_params(column_names, entries_count)
        column_names.each_with_index do |name, index|
            self.table.setItemText(0, index, name)
        end
        self.total_pages = (entries_count / self.items_per_page.to_f).ceil
        self.page_label.text = "Страница #{self.current_page} из #{self.total_pages}"
    end

    def set_table_data(data_table)
        clear_table
        (0...data_table.row_count).each do |row|
            (0...data_table.col_count).each do |col|
                self.table.setItemText(row, col, data_table.get_element(row, col).to_s)
            end
        end
    end

    def setup_filter_area(parent)
        FXLabel.new(parent, "ФИЛЬТРАЦИЯ")

        name_text_field = nil
        FXLabel.new(parent, "Фамилия и инициалы:")
        name_text_field = FXTextField.new(parent, 25, opts: TEXTFIELD_NORMAL)

        self.filters['name'] = { text_field: name_text_field }

        add_filtering_row(parent, "Git:")
        add_filtering_row(parent, "Email:")
        add_filtering_row(parent, "Телефон:")
        add_filtering_row(parent, "Telegram:")

        FXButton.new(parent, "Сбросить", opts: BUTTON_NORMAL).connect(SEL_COMMAND) do
            reset_filters
        end
    end

    def add_filtering_row(parent, label)
        FXLabel.new(parent, label)
        combo = FXComboBox.new(parent, 3, opts: LAYOUT_FILL_X | FRAME_SUNKEN | FRAME_THICK | COMBOBOX_STATIC)
        combo.numVisible = 3
        combo.appendItem("Не важно")
        combo.appendItem("Да")
        combo.appendItem("Нет")
        text_field = FXTextField.new(parent, 15, opts: TEXTFIELD_NORMAL)
        text_field.visible = false

        self.filters[label] = { combo: combo, text_field: text_field }

        combo.connect(SEL_COMMAND) do
            text_field.visible = (combo.currentItem == 1)
            parent.recalc
        end
    end


    def setup_table_area(parent)
        # Таблица
        self.table = FXTable.new(parent, opts: LAYOUT_FILL_X | LAYOUT_FILL_Y | TABLE_READONLY | TABLE_COL_SIZABLE)
        self.table.setTableSize(self.items_per_page, 4)
        self.table.setColumnWidth(0, 30)
        (1...4).each { |col| self.table.setColumnWidth(col, 180) }
        self.table.rowHeaderWidth = 0
        self.table.columnHeaderHeight = 0
        self.table.setColumnWidth(2, 253)

        self.table.connect(SEL_COMMAND) do |_, _, pos|
            if pos.row == 0 && pos.col == 1
                self.controller.sort_table_by_column
                self.controller.refresh_data
            end

            if pos.col == 0
                self.table.selectRow(pos.row)
            end

            update_buttons_state
        end

        # Навигация по страницам
        navigation_frame = FXHorizontalFrame.new(parent, opts: LAYOUT_FILL_X)
        self.prev_button = FXButton.new(navigation_frame, "Предыдущая", opts: BUTTON_NORMAL | LAYOUT_LEFT)
        self.next_button = FXButton.new(navigation_frame, "Следующая", opts: BUTTON_NORMAL | LAYOUT_RIGHT)
        self.page_label = FXLabel.new(navigation_frame, "Страница 1", opts: LAYOUT_CENTER_X)

        self.prev_button.connect(SEL_COMMAND) { change_page(-1) }
        self.next_button.connect(SEL_COMMAND) { change_page(1) }
    end

    def setup_control_area(parent)
        FXLabel.new(parent, "УПРАВЛЕНИЕ", opts: LAYOUT_FILL_X)

        # Кнопка "Добавить" - доступна всегда
        add_button = FXButton.new(parent, "Добавить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
        add_button.connect(SEL_COMMAND) do
            create_entry
        end

        # Кнопка "Удалить" - доступна только если выделена хотя бы одна строка
        self.delete_button = FXButton.new(parent, "Удалить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
        delete_button.connect(SEL_COMMAND) do
            delete_entries
        end

        # Кнопка "Изменить" - доступна только если выделена одна строка
        self.edit_button = FXButton.new(parent, "Изменить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
        edit_button.connect(SEL_COMMAND) do
            update_entry
        end

        # Кнопка "Обновить" - доступна всегда
        refresh_button = FXButton.new(parent, "Обновить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
        refresh_button.connect(SEL_COMMAND) do
            refresh_data
        end

        # Обновляем доступность кнопок при изменении выделения в таблице
        self.table.connect(SEL_CHANGED) do
            update_buttons_state
        end

        # Инициализация состояния кнопок
        update_buttons_state
    end

    def update_buttons_state
        selected_rows = (0...self.table.numRows).select { |row| self.table.rowSelected?(row) }
        self.delete_button.enabled = !selected_rows.empty?
        self.edit_button.enabled = (selected_rows.size == 1)
    end

    def change_page(offset)
        new_page = self.current_page + offset
        return if new_page < 1 || new_page > self.total_pages

        self.current_page = new_page
        self.controller.refresh_data
    end

    def show_error_message(message)
        if self.created?
            FXMessageBox.error(self, MBOX_OK, "Ошибка", message)
        else
            puts "Ошибка: #{message}"
        end
    end

    def create
        super
        show(PLACEMENT_SCREEN)
    end
    attr_accessor :current_page, :items_per_page

    private
    attr_accessor :filters, :table, :prev_button, :next_button, :page_label, :sort_order, :selected_rows, :edit_button, :delete_button, :controller, :total_pages

    def reset_filters
        self.filters.each do |key, field|
            field[:combo].setCurrentItem(0) if !field[:combo].nil?
            field[:text_field].text = ""
            field[:text_field].visible = false if key != 'name'
        end
        refresh_data
    end

    def clear_table
        (0...self.table.numRows).each do |row|
            (0...self.table.numColumns).each do |col|
                self.table.setItemText(row, col, "")
            end
        end
    end

end