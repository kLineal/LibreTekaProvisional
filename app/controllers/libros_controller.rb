class LibrosController < ApplicationController

def index

# mostramos dummy csv file

#@data = Libro.read_from_csv
#column = Libro.column_names
#array = ["t","a","e","i"]

@libros = Libro.all
end

# DELETE /libros/:id
def destroy

  libro = Libro.find(params[:id])
  
  libro.destroy!
  
  redirect_to libros_path
  
end


# POST /libros
def create

  # lee desde /public/csv/input.csv
  # y crea un record por fila.
  # 
  Libro.load_from_csv
  
  redirect_to libros_path
end

# DELETE /libros
# esta accion es solo para facilitar testing...
def destroy_batch

  Libro.all.each { |libro| libro.destroy!  }
  redirect_to libros_path
end

end
