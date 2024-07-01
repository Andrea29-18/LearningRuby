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

