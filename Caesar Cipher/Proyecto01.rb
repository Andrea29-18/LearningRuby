#Segunda Forma
def cifrar_cesar(texto, desplazamiento)
    alfabeto = ('a'..'z').to_a # Generar un array con todas las letras del alfabeto en minúsculas. TEMA: RANGO en ARRAYS
    texto_cifrado = texto.chars.map do |caracter|
      if alfabeto.include?(caracter.downcase)
        indice_actual = alfabeto.find_index(caracter.downcase)
        indice_nuevo = (indice_actual + desplazamiento) % alfabeto.size
        caracter_cifrado = alfabeto[indice_nuevo]
        caracter == caracter.upcase ? caracter_cifrado.upcase : caracter_cifrado
      else
        caracter
      end
    end
    texto_cifrado.join
  end
  
  def descifrar_cesar(texto, desplazamiento)
    cifrar_cesar(texto, -desplazamiento)
  end
  
  puts "Introduce el texto a cifrar:"
  texto = gets.chomp
  puts "Introduce el desplazamiento:"
  desplazamiento = gets.chomp.to_i
  
  texto_cifrado = cifrar_cesar(texto, desplazamiento)
  puts "Texto cifrado: #{texto_cifrado}"
  
  texto_descifrado = descifrar_cesar(texto_cifrado, desplazamiento)
  puts "Texto descifrado: #{texto_descifrado}"
  