---
authors: ['Ferthedems']
date: 2013-02-16 12:05:00+00:00
layout: post
title: Atajos de teclado del shell Bash (Linux)
thumbnail: ['/attachments/2013/02/tux_keyboard_closeup_800.jpg', 'Atajos de teclado en Linux']
categories: ['linux', 'tutoriales']
tags: ['bash', 'atajos', 'terminal']
---

Cuando pasamos muchas horas ante la _terminal_ de Linux, se hace necesario aprender caminos más cortos para agilizar nuestro trabajo. En esta publicación haremos una recopilación de los **atajos de teclado** para Bash _(la terminal por defecto en la mayoría de las distribuciones Linux)_. Os recomiendo que si utilizáis esta herramienta hagáis un pequeño _esfuerzo añadido_ para memorizar algunas de éstas combinaciones, pues **a la larga resultan muy ventajosas**. ¡No desperdiciéis la oportunidad de convertiros en "ninjas de la terminal"!

<div class="alert alert-warning">
No se incluyen todos los atajos, sólo aquellos que se han considerado como **más útiles**. De ese modo pretendemos **evitar el exceso de información**, y centrarnos en lo que consideramos más sustancial.
</div>

##### _Comandos con la tecla CTRL_

<table class="table table-striped">
    <thead>
        <tr>
            <th>Atajo</th>
            <th>Significado</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>CTRL + A</td>
            <td>Se envía el puntero al comienzo de la línea del prompt.</td>
        </tr>
        <tr>
            <td>CTRL + C</td>
            <td>Se aborta la ejecución del proceso actual. Útil para frenar la ejecución de un script.</td>
        </tr>
        <tr>
            <td>CTRL + D</td>
            <td>Se envía una señal de EOF. Útil para _detener la ejecución de intérpretes_ como los de Python, Ruby o Java.</td>
        </tr>
        <tr>
            <td>CTRL + E</td>
            <td>Se envía el puntero al final de la línea del prompt.</td>
        </tr>
        <tr>
            <td>CTRL + K</td>
            <td>Se elimina el contenido de la línea desde la posición del puntero hacia la derecha.</td>
        </tr>
        <tr>
            <td>CTRL + L</td>
            <td>Se limpia la pantalla de la misma forma que con el comando _clear_ o _cls_ (ms-dos).</td>
        </tr>
        <tr>
            <td>CTRL + O</td>
            <td>Ejecutar comando (igual que el pulsar _intro_).</td>
        </tr>
        <tr>
            <td>CTRL + R</td>
            <td>Se busca en el historial el último comando que corresponda a la búsqueda que introduzcamos.</td>
        </tr>
        <tr>
            <td>CTRL + U</td>
            <td>Se corta el texto a la izquierda del puntero. Útil si tecleamos un comando que vamos a usar con posterioridad o queremos borrar una línea.</td>
        </tr>
        <tr>
            <td>CTRL + Y</td>
            <td>Se pega el texto que ha sido cortado con CTRL+U.</td>
        </tr>
        <tr>
            <td>CTRL + Izquierda</td>
            <td>Se desplaza el puntero una palabra a la izquierda.</td>
        </tr>
        <tr>
            <td>CTRL + Derecha</td>
            <td>Se desplaza el puntero una palabra a la derecha.</td>
        </tr>
    </tbody>
</table>

##### _Otros comandos_

<table class="table table-striped">
    <thead>
        <tr>
            <th>Atajo</th>
            <th>Significado</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>SHIFT + Insert</td>
            <td>Se pega el contenido del portapapeles.</td>
        </tr>
        <tr>
            <td>Flecha Arriba</td>
            <td>Se muestra el comando anteriormente ejecutado.</td>
        </tr>
        <tr>
            <td>Flecha Abajo</td>
            <td>Se muestra el siguiente comando que hemos ejecutado.</td>
        </tr>
    </tbody>
</table>

Como apunte comentar, también, que con independencia de estas combinaciones de teclas propias del _shell Bash_, cada programa emulador de terminal tiene sus propios atajos, que podéis consultar en las opciones de muchos de ellos e incluso **redefinir a vuestro gusto**.

<img alt="Ejemplo de una sesión de bash" src="/img/placeholder.gif" data-original="/attachments/2013/02/Captura-de-pantalla-de-2013-02-14-173322.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block;">

>[Fuente](http://travesuras.wordpress.com/2009/05/22/20090522-1/).
