# Cel Shading with Unity 6+
## About the project

<p align="center">
  <a href="https://github.com/Logan-dlp/Cel-Shading">
    <img src="images/CelShading.gif" alt="Logo" width="800" height="450">
  </a>
</p>

This project aims to implement Cel Shading with Unity's new way of calculating these additional lights.

## Getting Started

### Prerequisites

Install [Unity version 6000+](https://unity.com/releases/editor/archive)

### Installation

1. Make a Unity 6+ project.

2. Clone the repo in Asset folder in your project :
```sh
git clone https://github.com/Logan-dlp/Cel-Shading.git
```

## Contributing

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Shader integration

Integrable directly with a script in .shader or directly in a shader graph with the custom subshader `(Shaders/Graph/Subgraph/CelShadingSubgraph.shadersubgraph)`.

The example of integration on a shader graph is in the folder `(Shaders/Graph/CelShadingShaderGraph.shadergraph)`.

## Material integration

There are two examples of implementing shaders on materials, one directly with the script and the other with the shader graph in `(Materials/)`.

### Parameter in materials

- Main Color : which allows you to have a color in addition to the texture.
- Main Texture : the texture of the object in question.
- Cutoff Tresholds : which allows you to manage the position of the light cutting.
- Ambient Light Strength : which allows you to manage the power of the light on the object.

## Contact

Logan Delachapelle - [logan.delachapelle[at]gmail.com](mailto:logan.delachapelle@gmail.com)

Copyright © 2025 - Logan-dlp

