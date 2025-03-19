# SpectrumSupport - Accesibilidad para Daltónicos en Godot

**Este plugin para Godot Engine** permite *simular y corregir efectos visuales relacionados con el daltonismo*, ayudando a los desarrolladores a crear juegos y aplicaciones **más accesibles**. Incluye filtros para **protanopia**, **deuteranopia**, **tritanopia** y **acromatopsia** (*escala de grises*), permitiendo ver cómo los usuarios con daltonismo perciben los colores. Además, ofrece ajustes personalizables como **brillo**, **gamma** y **desplazamiento de tono** para mejorar la visibilidad.

Con una **integración sencilla en Godot**, el plugin utiliza *shaders* para aplicar efectos en tiempo real **sin afectar el rendimiento**. Es ideal para *pruebas de accesibilidad*, *corrección visual* y *educación*, asegurando que tu proyecto sea **inclusivo y accesible para todos**.


# ¿Qué es el Daltonismo?
El daltonismo es la incapacidad para ver algunos colores en la forma normal. Este ocurre cuando hay un problema con los pigmentos en ciertas células nerviosas del ojo que perciben el color. Estas células se llaman conos y se encuentran en la capa de tejido sensible a la luz que recubre la parte posterior del ojo, llamada la retina 

### Los distintos tipos
Su clasificación puede darse por la cantidad de tipos de pigmentos afectados. Además, existe una diferenciación dependiendo de la familia de conos afectada.


| Nombre         | Descripción                                                                                   |
|----------------|-----------------------------------------------------------------------------------------------|
| **Acromático** | El individuo ve en blanco y negro (escala de grises). No percibe ningún color debido a la ausencia o disfunción de los tres tipos de conos, o por razones neurológicas. |
| **Monocromático** | Solo existe uno de los tres pigmentos de los conos, por lo que la visión del color queda reducida a una sola dimensión. |
| **Dicromático** | Falta o hay una disfunción en uno de los tres mecanismos básicos del color. Es hereditario y se divide en tres tipos: **Protanopia** (dificultad con los tonos rojos), **Deuteranopia** (dificultad con los tonos verdes) y **Tritanopia** (dificultad con los tonos azules). |

# Características principales

- Simulación de daltonismo:
  - Filtros para protanopia, deuteranopia, tritanopia y acromatopsia (escala de grises).

- Ajustes personalizables:
  - Control de gravedad del daltonismo (intensidad del filtro).
  - Ajuste de brillo, gamma y desplazamiento de tono (hue shift).

- Shaders en tiempo real:
  - Efectos visuales optimizados con shaders para un rendimiento eficiente.

- Reset de parámetros:
  - Función para restablecer todos los ajustes a sus valores predeterminados.

- Accesibilidad:
  - Herramienta para mejorar la inclusión y accesibilidad en juegos y aplicaciones.

- Compatibilidad:
  - Funciona en proyectos 2D, 3D y es compatible con Godot 4.x.

# Media

### Showcase
[![SpectrumSupport](https://i.imgur.com/8j8RsaB.png)](https://www.youtube.com/watch?v=-cCVabgf0T4)

### Filtro de Protanopia (dificultad con el rojo), Coche rojo sobre fondo verde.
![Protanopia](https://github.com/AnnieIsthar/SpectrumSupport/blob/aaa28f1ee44ad4066ffbd2d80fdabb050990d739/Screenshots/Protanopia.png)

### Filtro de Deuteranopia (dificultad con el verde), Coche amarillo sobre fondo verde.
![Deuteranopia](https://github.com/AnnieIsthar/SpectrumSupport/blob/aaa28f1ee44ad4066ffbd2d80fdabb050990d739/Screenshots/Deuteranopia.png)

### Filtro de Tritanopia (dificultad con el azul), Coche amarillo sobre fondo azul.
![Tritanopia](https://github.com/AnnieIsthar/SpectrumSupport/blob/aaa28f1ee44ad4066ffbd2d80fdabb050990d739/Screenshots/Tritanopia.png)

### Acromatopsia (escala de grises), Coche rojo sobre fondo verde.
![Acromatopsia](https://github.com/AnnieIsthar/SpectrumSupport/blob/aaa28f1ee44ad4066ffbd2d80fdabb050990d739/Screenshots/Acromasia.png)

# Instalación

1. Clona este repositorio o descarga el archivo ZIP.

2. Copiar los archivos:
   - Copia la carpeta `addons` en la raíz de tu proyecto Godot.

3. Activar el plugin:
   - Abre tu proyecto en Godot.
   - Ve a `Proyecto > Ajustes del Proyecto > Plugins`.
   - Busca el plugin en la lista y actívalo.

4. Configurar el plugin:
   - Añade el nodo `SpectrumSupport` a tu escena principal.
   - Ajusta los parámetros mediante código.

# Uso

Agregar el nodo:
En tu escena de Godot, buscandolo como SpectrumSupport .

Configurar el script:
En el script de tu escena principal, crea una variable onready para acceder al nodo del plugin:

```
extends Node2D

@onready var spectrum_support = $SpectrumSupport
```
Usar las funciones:
Una vez que tienes la referencia al nodo, puedes usar las siguientes funciones para aplicar filtros y ajustar parámetros:

```
# Cambiar el tipo de filtro (0: Normal, 1: Protanopia, 2: Deuteranopia, 3: Tritanopia, 4: Acromatopsia)
spectrum_support.set_filter(1)  # Ejemplo: Protanopia

# Ajustar la gravedad del filtro (0.0: Desactivado, 1.0: Máxima intensidad)
spectrum_support.set_severity(0.8)  # Ejemplo: 80% de intensidad

# Ajustar el brillo (-1.0: Oscuro, 1.0: Brillante)
spectrum_support.set_brightness(0.2)  # Ejemplo: Aumentar brillo

# Ajustar la gamma (0.1: Oscuro, 3.0: Claro)
spectrum_support.set_gamma(1.2)  # Ejemplo: Aumentar gamma

# Ajustar el desplazamiento de tono (-1.0 a 1.0)
spectrum_support.set_hue_shift(0.1)  # Ejemplo: Desplazar tono ligeramente
```

Resetear parámetros:
Si deseas restablecer todos los ajustes a sus valores predeterminados, usa la función reset_parameters:

```
spectrum_support.reset_parameters()
```
### Funciones

| Función               | Descripción                              | Rango de valores / Opciones       |
|-----------------------|------------------------------------------|-----------------------------------|
| `set_filter(mode)`    | Cambia el tipo de filtro de daltonismo.  | `0`: Normal<br>`1`: Protanopia<br>`2`: Deuteranopia<br>`3`: Tritanopia<br>`4`: Acromatopsia |
| `set_severity(value)` | Ajusta la intensidad del filtro.         | `0.0` (desactivado) a `1.0` (máxima intensidad) |
| `set_brightness(value)` | Ajusta el brillo de la imagen.         | `-1.0` (oscuro) a `1.0` (brillante) |
| `set_gamma(value)`    | Ajusta la gamma de la imagen.            | `0.1` (oscuro) a `3.0` (claro)     |
| `set_hue_shift(value)` | Desplaza el tono de los colores.       | `-1.0` a `1.0`                     |
| `reset_parameters()`  | Restablece todos los parámetros.         | -                                  |

# Licencia

Este proyecto se distribuye bajo una **licencia de código abierto** (MIT). Esto significa que puedes usarlo, modificarlo y distribuirlo libremente, siempre y cuando se incluya el aviso de copyright y la licencia en las copias.

# Enlaces relacionados

- [¿Qué es el daltonismo?](https://es.wikipedia.org/wiki/Daltonismo) - Información general sobre el daltonismo.
- [Cómo funciona la visión del color](https://www.nei.nih.gov/learn-about-eye-health/eye-conditions-and-diseases/color-blindness) - Explicación detallada sobre la percepción del color.
- [Accesibilidad en videojuegos](https://www.gamasutra.com/view/feature/134758/designing_for_color_blindness.php) - Artículo sobre la importancia de diseñar juegos accesibles para personas con daltonismo.
- [Herramientas de diseño inclusivo](https://www.color-blindness.com/) - Recursos para diseñar pensando en la accesibilidad visual.

# Gracias

Hola, soy **Annastasya** 👋, y soy daltónica. Este plugin nació de mi deseo de hacer que los juegos y aplicaciones sean más inclusivos para personas como yo. El daltonismo es una parte importante de mi vida, y quiero ayudar a los desarrolladores a entender cómo podemos percibir el mundo de manera diferente. ¡Espero que este plugin te inspire a crear experiencias más accesibles para todos! 💖

