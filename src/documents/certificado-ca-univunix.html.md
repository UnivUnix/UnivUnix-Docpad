---
date: 2014-06-12 19:55:36+00:00
layout: page
isPage: true
pageOrder: 2
title: Certificado CA
---

Como ya sabrán por nuestro aviso por las redes sociales, con motivo de la iniciativa **Reset the net** UnivUnix se comprometió a implantar SSL para mejorar la privacidad de nuestros usuarios y, además, añadir un extra de seguridad que nunca viene mal.
Debido a la falta de medios para costear un certificado SSL wildcard (multidominio, si no, sería un certificado por dominio), hemos optado por crear nuestra propia autoridad certificadora o CA.

Para que funcionen los certificados, es necesario incorporar esta CA a nuestra base de datos de claves. Para quienes no sepan cómo hacerlo, en unos días iré incorporando breves explicaciones para los navegadores más conocidos. También está la alternativa de añadir una excepción de seguridad a esta web, pero la opción de incorporar la CA es más segura y menos traumática.

Para cualquier duda, pueden [acudir al foro](https://forum.univunix.com/topic/4/univunix-ya-funciona-sobre-seguro).

<a class="btn btn-primary" href="/attachments/certs/CAUnivUnix.pem">
    Descargar certificado
</a>