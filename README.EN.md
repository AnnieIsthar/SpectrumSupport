# SpectrumSupport - Color Blindness Accessibility for Godot

**This plugin for Godot Engine** allows you to *simulate and correct visual effects related to color blindness*, helping developers create **more accessible** games and applications. It includes filters for **protanopia**, **deuteranopia**, **tritanopia**, and **achromatopsia** (*grayscale*), enabling you to see how users with color blindness perceive colors. Additionally, it offers customizable settings such as **brightness**, **gamma**, and **hue shift** to improve visibility.

With **simple integration in Godot**, the plugin uses *shaders* to apply real-time effects **without impacting performance**. It is ideal for *accessibility testing*, *visual correction*, and *education*, ensuring your project is **inclusive and accessible for everyone**.

# What is Color Blindness?
Color blindness is the inability to see certain colors normally. It occurs when there is an issue with the pigments in specific nerve cells of the eye that detect color. These cells, called cones, are found in the light-sensitive tissue at the back of the eye, known as the retina.

### Different Types
Color blindness is classified based on the number of affected pigment types. Additionally, it is categorized based on the type of affected cone family.

| Name             | Description                                                                                   |
|-----------------|-----------------------------------------------------------------------------------------------|
| **Achromatic**  | The individual sees in black and white (grayscale). No color perception due to the absence or dysfunction of all three types of cones, or due to neurological reasons. |
| **Monochromatic** | Only one of the three cone pigments is present, reducing color vision to a single dimension. |
| **Dichromatic** | One of the three basic color mechanisms is missing or dysfunctional. This is hereditary and is divided into three types: **Protanopia** (difficulty with red tones), **Deuteranopia** (difficulty with green tones), and **Tritanopia** (difficulty with blue tones). |

# Main Features

- Color blindness simulation:
  - Filters for protanopia, deuteranopia, tritanopia, and achromatopsia (grayscale).

- Customizable settings:
  - Control the severity of color blindness (filter intensity).
  - Adjust brightness, gamma, and hue shift.

- Real-time shaders:
  - Optimized visual effects using shaders for efficient performance.

- Parameter reset:
  - Function to restore all settings to their default values.

- Accessibility:
  - A tool to enhance inclusivity and accessibility in games and applications.

- Compatibility:
  - Works in both 2D and 3D projects and is compatible with Godot 4.x.

# Media

### Showcase

[![SpectrumSupport](https://img.youtube.com/vi/-cCVabgf0T4/maxresdefault.jpg)](https://youtu.be/-cCVabgf0T4)

### Protanopia Filter (difficulty with red), Red car on a green background.
![Protanopia](https://github.com/AnnieIsthar/SpectrumSupport/blob/aaa28f1ee44ad4066ffbd2d80fdabb050990d739/Screenshots/Protanopia.png)

### Deuteranopia Filter (difficulty with green), Yellow car on a green background.
![Deuteranopia](https://github.com/AnnieIsthar/SpectrumSupport/blob/aaa28f1ee44ad4066ffbd2d80fdabb050990d739/Screenshots/Deuteranopia.png)

### Tritanopia Filter (difficulty with blue), Yellow car on a blue background.
![Tritanopia](https://github.com/AnnieIsthar/SpectrumSupport/blob/aaa28f1ee44ad4066ffbd2d80fdabb050990d739/Screenshots/Tritanopia.png)

### Achromatopsia (grayscale), Red car on a green background.
![Achromatopsia](https://github.com/AnnieIsthar/SpectrumSupport/blob/aaa28f1ee44ad4066ffbd2d80fdabb050990d739/Screenshots/Acromasia.png)

# Installation

1. Clone this repository or download the ZIP file.

2. Copy the files:
   - Copy the `addons` folder to the root of your Godot project.

3. Enable the plugin:
   - Open your project in Godot.
   - Go to `Project > Project Settings > Plugins`.
   - Find the plugin in the list and activate it.

4. Configure the plugin:
   - Add the `SpectrumSupport` node to your main scene.
   - Adjust parameters via code.

# Usage

Add the node:
In your Godot scene, search for `SpectrumSupport`.

Configure the script:
In your main scene script, create an `onready` variable to access the plugin node:

```gdscript
extends Node2D

@onready var spectrum_support = $SpectrumSupport
```

Use the functions:
Once you have a reference to the node, you can use the following functions to apply filters and adjust parameters:

```gdscript
# Change filter type (0: Normal, 1: Protanopia, 2: Deuteranopia, 3: Tritanopia, 4: Achromatopsia)
spectrum_support.set_filter(1)  # Example: Protanopia

# Adjust filter severity (0.0: Disabled, 1.0: Maximum intensity)
spectrum_support.set_severity(0.8)  # Example: 80% intensity

# Adjust brightness (-1.0: Dark, 1.0: Bright)
spectrum_support.set_brightness(0.2)  # Example: Increase brightness

# Adjust gamma (0.1: Dark, 3.0: Bright)
spectrum_support.set_gamma(1.2)  # Example: Increase gamma

# Adjust hue shift (-1.0 to 1.0)
spectrum_support.set_hue_shift(0.1)  # Example: Slight hue shift
```

Reset parameters:
To restore all settings to their default values, use the `reset_parameters` function:

```gdscript
spectrum_support.reset_parameters()
```

### Functions

| Function             | Description                              | Value Range / Options       |
|---------------------|------------------------------------------|-----------------------------|
| `set_filter(mode)`   | Changes the type of color blindness filter.  | `0`: Normal<br>`1`: Protanopia<br>`2`: Deuteranopia<br>`3`: Tritanopia<br>`4`: Achromatopsia |
| `set_severity(value)` | Adjusts filter intensity.         | `0.0` (disabled) to `1.0` (max intensity) |
| `set_brightness(value)` | Adjusts image brightness.         | `-1.0` (dark) to `1.0` (bright) |
| `set_gamma(value)`    | Adjusts image gamma.            | `0.1` (dark) to `3.0` (bright) |
| `set_hue_shift(value)` | Adjusts hue shift.       | `-1.0` to `1.0` |
| `reset_parameters()`  | Resets all parameters.         | - |

# License

This project is distributed under the **MIT open-source license**. This means you can use, modify, and distribute it freely as long as the copyright notice and license are included in copies.

# Related Links

- [What is Color Blindness?](https://en.wikipedia.org/wiki/Color_blindness) - General information on color blindness.
- [How Color Vision Works](https://www.nei.nih.gov/learn-about-eye-health/eye-conditions-and-diseases/color-blindness) - Detailed explanation of color perception.
- [Accessibility in Video Games](https://www.gamasutra.com/view/feature/134758/designing_for_color_blindness.php) - The importance of designing accessible games for people with color blindness.

# Thanks

Hi, I'm **Annastasya** 👋, and I'm color blind. This plugin was born from my desire to make games and applications more inclusive for people like me. Color blindness is a significant part of my life, and I want to help developers understand how we perceive the world differently. I hope this plugin inspires you to create more accessible experiences for everyone! 💖
