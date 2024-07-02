#La IA me ayudo
def substrings(palabra, diccionario)
    resultado = Hash.new(0) # Crea un hash con valor predeterminado 0
    palabra = palabra.downcase # Convierte toda la palabra/frase a minúsculas
    
    # Itera sobre cada subcadena en el diccionario
    diccionario.each do |subcadena|
      subcadena = subcadena.downcase # Asegura que la subcadena también esté en minúsculas
      
      # Busca la subcadena en la palabra y cuenta cuántas veces aparece
      coincidencias = palabra.scan(subcadena).length
      
      # Si la subcadena se encuentra, agrégala al hash de resultados
      resultado[subcadena] += coincidencias if coincidencias > 0
    end
  
    resultado # Devuelve el hash de resultados
  end
  
  # Ejemplos de uso
  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  
  puts substrings("below", dictionary)
  # Output esperado: { "below" => 1, "low" => 1 }
  
  puts substrings("Howdy partner, sit down! How's it going?", dictionary)
  # Output esperado: { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
  