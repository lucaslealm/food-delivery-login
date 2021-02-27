class EmployeeRepository

    def initialize(csv_file)
        @csv_file = csv_file
        @employees = []
        load_csv if File.exist?(@csv_file)
    end
end

private

def load_csv
  csv_options = { headers: :first_row, header_converters: :symbol }
  CSV.foreach(@csv_file, csv_options) do |row|
    row[:id] = row[:id].to_i
    @employees << Employee.new(row)
  end
end