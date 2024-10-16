<h1 align="center">
    <img src="https://readme-typing-svg.herokuapp.com?font=Righteous&duration=4000&pause=1000&center=true&vCenter=true&height=70&lines=Hello!+%F0%9F%91%8B;Today+we+present+%22Installer+System%22" />
</h1>

<br/>

# Installer System

¡Bienvenido a **Rendorrr Dev**! Este proyecto te permitirá crear un instalador para tu aplicación utilizando Electron. A continuación, te guiaré a través de los pasos necesarios para configurarlo correctamente.

## Requisitos Previos

Asegúrate de tener **Node.js** y **npm** instalados en tu sistema. Puedes descargar Node.js desde [aquí](https://nodejs.org/).

## Pasos de Configuración

### 1. Verifica tu archivo `package.json`

Cuando ejecutaste `npm init -y`, debió generarse un archivo `package.json`. Si no se creó o está mal configurado, puedes corregirlo de la siguiente manera:

1. Navega al directorio de tu proyecto:

   ```bash
   cd SkyHostingInstaller
   ```

2. Ejecuta el siguiente comando para generar un archivo `package.json` básico:

   ```bash
   npm init -y
   ```

### 2. Instala Electron como dependencia

Es esencial tener **Electron** instalado como una dependencia de desarrollo en tu proyecto. Ejecuta:

```bash
npm install electron --save-dev
```

Esto añadirá Electron a tu `package.json` como dependencia, asegurando que se encuentre al empaquetar la aplicación.

### 3. Empaqueta tu aplicación

Con el archivo `package.json` correctamente configurado, ahora puedes empaquetar tu aplicación. Ejecuta el siguiente comando:

```bash
npx electron-packager . InstallerSytem --platform=win32 --arch=x64 --icon=icon.ico --out=dist
```

Este comando generará el ejecutable `.exe` de tu aplicación en la carpeta `dist`.

## Contribuciones

¡Las contribuciones son bienvenidas! Si tienes sugerencias o mejoras, no dudes en abrir un **Issue** o un **Pull Request**.

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.
