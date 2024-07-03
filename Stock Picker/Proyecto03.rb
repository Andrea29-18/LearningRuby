def stock_picker(precios)
    mejor_compra = 0
    mejor_venta = 0
    max_beneficio = 0
  
    precios.each_with_index do |precio_compra, dia_compra|
      precios[dia_compra+1..-1].each_with_index do |precio_venta, offset|
        dia_venta = dia_compra + 1 + offset
        beneficio = precio_venta - precio_compra
  
        if beneficio > max_beneficio
          mejor_compra = dia_compra
          mejor_venta = dia_venta
          max_beneficio = beneficio
        end
      end
    end
  
    [mejor_compra, mejor_venta]
  end
  
  # Ejemplo de uso
  puts stock_picker([17,3,6,9,15,8,6,1,10]).inspect
  # Output esperado: [1, 4]
  