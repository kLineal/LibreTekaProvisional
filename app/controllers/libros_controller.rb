class LibrosController < ApplicationController

def index

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
