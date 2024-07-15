# LearningRuby
Learning basic concepts, connection, syntax of the programming language Ruby 

# Introducción 
- Ruby utiliza POO
- Tiene 4 tipos de datos
    - Números (enteros y flotadores)
    - Cadenas
    - Símbolos
    - Booleanos (true, false, y nil).
- Al hacer aritmética con dos enteros en Ruby, el resultado siempre será un número entero.
---

# Números
- **Addition**
    -   1 + 1   #=> 2
- **Subtraction**
    - 2 - 1   #=> 1
- **Multiplication**
    - 2 * 2   #=> 4
- **Division**
    - 10 / 5  #=> 2
- **Exponent**
    - 2 ** 2  #=> 4
    - 3 ** 4  #=> 81
- **Modulus (find the remainder of division)**
    - 8 % 2   #=> 0  (8 / 2 = 4; no remainder)
    - 10 % 4  #=> 2  (10 / 4 = 2 with a remainder of 2)

## Convertir tipos de números
Ruby hace que sea muy fácil convertir flotadores en enteros y viceversa.

```
To convert an integer to a float:

13.to_f   #=> 13.0

To convert a float to an integer:

13.0.to_i #=> 13
13.9.to_i #=> 13
```

## Algunos métodos numéricos útiles
Hay muchos métodos útiles para los números integrados en Ruby. Por ejemplo,

```
#incluso
6.even? #=> true
7.even? #=> false

#odd?
6.odd? #=> false
7.odd? #=> 
```
# Concatenación
En el verdadero estilo Ruby, hay muchas maneras de concatenar cuerdas.

- With the plus operator:
```
"Welcome " + "to " + "Odin!"    #=> "Welcome to Odin!"
```
- With the shovel operator:
```
"Welcome " << "to " << "Odin!"  #=> "Welcome to Odin!"
```
- With the concat method:
```
"Welcome ".concat("to ").concat("Odin!")  #=> "Welcome to Odin!"
```

## Convertir otros objetos en cadenas
Usando el to_s método, puede convertir casi cualquier cosa en una cadena. Aquí hay algunos ejemplos:

```
5.to_s        #=> "5"

nil.to_s      #=> ""

:symbol.to_s  #=> "symbol"
```

# Declarando una variable
Así es como se crea una variable en Ruby:
```
age = 18 #=> 18
```
Hay operadores de asignación similares para todos los operadores matemáticos comunes:

```
age = 18
age -= 2  #=> 16

cash = 10
cash *= 2 #=> 20

temperature = 40
temperature /= 10 #=> 4
```
Los nombres de variables siempre deben estar en minúsculas, y las palabras múltiples que componen un nombre de variable deben dividirse por un guion bajo. 

```
# bad
a = 19
string = "John"

# good
age = 19
name = "John"
can_swim = false
```
# Verdad y falsedad en Ruby

Ya sabe que las declaraciones condicionales verifican las expresiones para un valor verdadero o falso, por lo que debe comprender lo que Ruby considera verdadero o falso. 

En la moda típica de Ruby, es muy simple. Los únicos **valores falsos en Ruby son los valores nil y false** ellos mismos.

Todo lo demás se considera cierto. ***Incluso la cuerda "false" es cierto en expresiones condicionales!***, es posible que esté familiarizado con el número 0 o una cadena vacía (“”) que sea equivalente a falsa. Este no es el caso de Ruby.

## Declaración condicional básica
```
if statement_to_be_evaluated == true
  # do something awesome...
end

if 1 < 2
  puts "Hot diggity, 1 is less than 2!"
end
#=> Hot diggity, 1 is less than 2!
```

## Lógica booleana
Para determinar si una expresión se evalúa como true o false, necesitarás un operador de comparación. Hay varios proporcionados por Ruby:

***== (iguales)*** devoluciones true si los valores comparados son iguales.
```
5 == 5 #=> true
5 == 6 #=> false
```

***!= (no igual)*** devoluciones true si los valores comparados no son iguales.
```
5 != 7 #=> true
5 != 5 #=> false
```

***> (mayor que)*** devoluciones true si el valor a la izquierda del operador es mayor que el valor a la derecha.
```
7 > 5 #=> true
5 > 7 #=> false
```

***< (menos de)*** devoluciones true si el valor a la izquierda del operador es menor que el valor a la derecha.
```
5 < 7 #=> true
7 < 5 #=> false
```

***>= (mayor o igual a)*** devoluciones true si el valor a la izquierda del operador es mayor o igual que el valor a la derecha.
```
7 >= 7 #=> true
7 >= 5 #=> true
```

***<= (menos o igual a)*** devoluciones true si el valor a la izquierda del operador es menor o igual que el valor a la derecha.
```
5 <= 5 #=> true
5 <= 7 #=> true
```

**#eql?** comprueba tanto el tipo de valor como el valor real que posee.
```
5.eql?(5.0) #=> false; although they are the same value, one is an integer and the other is a float
5.eql?(5)   #=> true
```

**#equal?** comprueba si ambos valores son exactamente el mismo objeto en la memoria. Esto puede ser un poco confuso debido a la forma en que las computadoras almacenan algunos valores de eficiencia. Dos variables que apuntan al mismo número generalmente regresarán true.
```
a = 5
b = 5
a.equal?(b) #=> true
```
Esto sucede porque las computadoras pueden almacenar cadenas de la misma manera eficiente en que almacenan números. Aunque los valores de las variables son los mismos, la computadora ha creado dos objetos de cadena separados en la memoria.

```
a = "hello"
b = "hello"
a.equal?(b) #=> false
```

Además de los operadores anteriores, Ruby tiene un operador especial que se conoce cariñosamente como el **operador de nave espacial**. A diferencia de los otros operadores de comparación, que todos regresan true o false, el operador de la nave espacial devuelve uno de tres valores numéricos.

***<=>(operador de nave espacial)*** devuelve lo siguiente:
- -1 si el valor de la izquierda es menor que el valor de la derecha;
- 0 si el valor de la izquierda es igual al valor de la derecha; y
- 1 si el valor de la izquierda es mayor que el valor de la derecha.

## Operadores lógicos
A veces querrás escribir una expresión que contenga más de una condición. En Ruby, esto se logra con operadores lógicos, que son && (y), || (o) y ! (no).

El ***&&*** el operador devuelve true si ambos las expresiones izquierda y derecha regresan true.

```
if 1 < 2 && 5 < 6
  puts "Party at Kevin's!"
end

# This can also be written as
if 1 < 2 and 5 < 6
  puts "Party at Kevin's!"
end
```
Una cosa a tener en cuenta con el **&&** y **||** los operadores son el orden de la lógica. Las expresiones siempre se evalúan de izquierda a derecha.


Usando el && operador, ambas expresiones deben regresar true. **Si la primera expresión encontrada regresa false, entonces la segunda expresión nunca se comprueba.** Para el intérprete de Ruby, no tiene sentido evaluar la segunda mitad ya que la expresión general nunca puede regresar true.

Con el || operador,***si la primera expresión se evalúa como true, entonces la segunda expresión nunca se verifica porque la expresión completa ya está true*** , y se ejecuta el código en el bloque.

Esto se conoce como evaluación de cortocircuitos.

```
if 10 < 2 || 5 < 6 #=> although the left expression ismfalse, there is a party at Kevin's because the right expression returns true
  puts "Party at Kevin's!"
end

# This can also be written as
if 10 < 2 or 5 < 6
  puts "Party at Kevin's!"
end
```
### Operador ternario
El operador ternario es una línea if...else declaración que puede hacer que su código sea mucho más conciso.

Su sintaxis es ```conditional statement ? <execute if true> : <execute if false>.``` Puede asignar el valor de retorno de la expresión a una variable.

# Bucle
Es un bucle infinito que continuará a menos que solicite específicamente que se detenga, utilizando el break comando. Más comúnmente, break se usa con una condición, como se ilustra en el ejemplo a continuación.

## Hasta el bucle
El ```until loop``` es lo opuesto a la while bucle. A while el bucle continúa mientras la condición sea verdadera, mientras que un until el bucle continúa mientras la condición sea falsa. Por lo tanto, estos dos bucles se pueden usar prácticamente indistintamente. En última instancia, cuál es su condición de ruptura determinará cuál es más legible.

## Rangos
¿Qué pasa si sabemos exactamente cuántas veces queremos que se ejecute nuestro bucle? Ruby nos permite usar algo llamado a rango para definir un intervalo. Todo lo que necesitamos hacer es darle a Ruby el valor inicial, el valor final y si queremos que el rango sea inclusivo o exclusivo.

```
(1..5)      # inclusive range: 1, 2, 3, 4, 5
(1...5)     # exclusive range: 1, 2, 3, 4

# We can make ranges of letters, too!
('a'..'d')  # a, b, c, d
```

### Lazo de tiempos
Si necesita ejecutar un bucle por un número específico de veces, no busque más que el confiable #times bucle. Funciona iterando a través de un bucle un número específico de veces e incluso arroja la ventaja de acceder al número que está iterando actualmente.

```
5.times do
  puts "Hello, world!"
end
```
## Bucles Upto y Downto
Los métodos Ruby #upto y #downto haz exactamente lo que crees que hacen por sus nombres. Puede usar estos métodos para iterar desde un número inicial hasta o hacia abajo a otro número, respectivamente.
```
5.upto(10) { |num| print "#{num} " }     #=> 5 6 7 8 9 10

10.downto(5) { |num| print "#{num} " }   #=> 10 9 8 7 6 5
```
Si necesita pasar por una serie de números (o incluso letras) dentro de un rango específico, estos son los bucles para usted.

# Matrices

[Lección de Matrices](https://docs.ruby-lang.org/en/3.3/Array.html)

# Hashes
Los hashes Ruby son colecciones de datos más avanzadas y son similares a los objetos en JavaScript y diccionarios en Python si estás familiarizado con ellos.
```
my_hash = {
  "a random word" => "ahoy",
  "Dorothy's math test score" => 94,
  "an array" => [1, 2, 3],
  "an empty hash within a hash" => {}
}
```
[Leccion de Hashes](https://docs.ruby-lang.org/en/3.3/Hash.html)

# POO
## Gestión de Proyectos
Organizar sus proyectos en diferentes archivos tiene muchos beneficios prácticos. El principal de ellos es hacer que su código sea más modular, lo que facilita el ajuste y la comprensión del código a medida que se vuelve más complejo.

Para los proyectos de Ruby, `la regla de los pulgares es`:
- Una clase por archivo. Cada vez que cree una nueva clase, debe crear un nuevo archivo para que viva.
- Es una convención poner todos sus archivos Ruby en un directorio lib. Por ejemplo:

```
project_name
├── lib
│   └── lovely_file_of_yours.rb
└── main.rb
```

# Archivos y Serialización
