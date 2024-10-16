const { exec } = require('child_process');
const path = require('path');

document.getElementById('installBtn').addEventListener('click', () => {
    // Ocultamos el contenido inicial y mostramos la rueda de carga
    document.getElementById('content').classList.add('hidden');
    document.getElementById('loading').classList.remove('hidden');

    // Usamos una ruta relativa para el script
    const scriptPath = path.join(__dirname, 'scripts', 'bit.ps1');

    // Ejecutamos el script de PowerShell
    exec(`powershell -ExecutionPolicy Bypass -File "${scriptPath}"`, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error: ${error.message}`);
            // Aquí podrías mostrar un mensaje de error si quieres
            return;
        }
        if (stderr) {
            console.error(`Error: ${stderr}`);
            return;
        }
        console.log(`Output: ${stdout}`);
        
        // Aquí puedes hacer que la rueda de carga se quite o cambiar el texto al finalizar
        document.querySelector('#loading p').textContent = 'Instalación completada';

        // Cierra la ventana
        window.close();
    });
});