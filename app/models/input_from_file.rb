module InputFromFile

require 'csv'

# Este metodo es ajeno a los nombre de las columnas.
#
# De momento no hay ningun tipo de sanity check. 
# (asume que el csv tiene tantas columnas como columnas
# tiene la tabla 'libro')
def Libro.load_from_csv 


  # test file
  filename = "#{Rails.root}/public/csv/input.csv"
  CSV.foreach(filename) do |row|
    
    record = Libro.record_hash(row)
    Libro.create(record)
  end
end


def Libro.record_hash array_records

  # devuelve un array de strings con los nombres de las columnas, 
  # excepto:  - "id"
  #           - "created_at"
  #           - "update_at" 
  column_names = Libro.column_names
  keys = column_names.drop(1).take(column_names.size-3)
  
  # crea el hash keys ==> array_records
  if array_records.length == keys.length
    
    keys.zip(array_records).to_h
    
  end

end

end
