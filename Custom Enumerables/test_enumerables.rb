# test_enumerables.rb
# Primero, necesitamos importar los métodos que hemos creado en 'enumerables.rb'
require_relative 'enumerables' # Asegúrate de que el archivo 'enumerables.rb' esté en el mismo directorio

# Test para my_each
puts "Testing my_each:"
[1, 2, 3].my_each { |num| puts num } # Debería imprimir 1, 2, 3, uno por línea

# Test para my_select
puts "\nTesting my_select:"
p [1, 2, 3, 4, 5].my_select { |num| num.even? } # Debería imprimir [2, 4]

# Test para my_all?
puts "\nTesting my_all?j:"
p [1, 2, 3].my_all? { |num| num > 0 } # Debería imprimir true
p [1, 2, -3].my_all? { |num| num > 0 } # Debería imprimir false

# Test para my_any?
puts "\nTesting my_any?:"
p [1, 2, 3].my_any? { |num| num < 2 } # Debería imprimir true
p [1, 2, 3].my_any? { |num| num > 3 } # Debería imprimir false

# Test para my_none?
puts "\nTesting my_none?:"
p [1, 2, 3].my_none? { |num| num > 3 } # Debería imprimir true
p [1, 2, 3].my_none? { |num| num == 2 } # Debería imprimir false

# Test para my_count
puts "\nTesting my_count:"
p [1, 2, 3, 4].my_count { |num| num.even? } # Debería imprimir 2
p [1, 2, 3, 4].my_count # Debería imprimir 4 (sin bloque)

# Test para my_map
puts "\nTesting my_map:"
p [1, 2, 3].my_map { |num| num * 2 } # Debería imprimir [2, 4, 6]

# Test para my_inject
puts "\nTesting my_inject:"
p [1, 2, 3, 4].my_inject(0) { |sum, num| sum + num } # Debería imprimir 10
p [1, 2, 3, 4].my_inject { |product, num| product * num } # Debería imprimir 24
