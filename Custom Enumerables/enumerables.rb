module Enumerable
  # Método my_each: Itera sobre cada elemento y cede el control al bloque
  def my_each
    return to_enum(:my_each) unless block_given?

    for element in self
      yield(element) # Cede el control al bloque con el elemento actual
    end

    self # Retorna el objeto original para permitir el encadenamiento
  end

  # Método my_select: Selecciona los elementos que cumplen con la condición del bloque
  def my_select
    return to_enum(:my_select) unless block_given?

    selected_elements = [] # Inicializa un array vacío para almacenar los seleccionados

    my_each do |element|
      selected_elements << element if yield(element) # Añade elementos que cumplen la condición
    end

    selected_elements # Retorna el array con los elementos seleccionados
  end

  def my_all?
    return true unless block_given? # Si no hay bloque, se asume que todos los elementos son 'truthy'

    my_each do |element|
      return false unless yield(element) # Retorna false si algún elemento no cumple la condición
    end

    true # Si todos los elementos cumplen, retorna true
  end

  def my_any?
    return false unless block_given? # Si no hay bloque, se asume que al menos un elemento es 'truthy'

    my_each do |element|
      return true if yield(element) # Retorna true si algún elemento cumple la condición
    end

    false # Si ningún elemento cumple, retorna false
  end

  def my_none?
    return true unless block_given? # Si no hay bloque, se asume que todos los elementos son 'falsy'

    my_each do |element|
      return false if yield(element) # Retorna false si algún elemento cumple la condición
    end

    true # Si ningún elemento cumple, retorna true
  end

  def my_count
    count = 0 # Inicializa un contador en cero

    if block_given?
      my_each do |element|
        count += 1 if yield(element) # Incrementa el contador si el elemento cumple la condición del bloque
      end
    else
      my_each { count += 1 } # Si no hay bloque, cuenta todos los elementos
    end

    count # Retorna el total de elementos contados
  end

  # Este método transforma los elementos de la colección usando el bloque dado
  def my_map
    return to_enum(:my_map) unless block_given? # Retorna un enumerador si no hay bloque

    mapped_array = [] # Inicializa un array vacío para almacenar los resultados

    my_each do |element|
      mapped_array << yield(element) # Añade al array el resultado de aplicar el bloque a cada elemento
    end

    mapped_array # Retorna el array con los elementos transformados
  end

   # Este método combina todos los elementos de la colección usando un acumulador
  def my_inject(initial = nil)
    accumulator = initial || first # Si no hay valor inicial, usa el primer elemento de la colección

    # Si no hay valor inicial, comienza desde el segundo elemento
    start_index = initial ? 0 : 1

    # Itera desde el índice adecuado, aplicando el bloque a cada elemento
    self[start_index..-1].my_each do |element|
      accumulator = yield(accumulator, element) # El acumulador toma el resultado del bloque
    end

    accumulator # Retorna el valor final del acumulador
  end

end
