---
authors: ['Aglezabad']
date: 2013-02-22 23:30:02+00:00
layout: post
slug: mejorando-lo-mejorable-buenas-practicas-en-nginx-conf
title: 'Mejorando lo mejorable: Buenas prácticas en nginx.conf'
thumbnail: ['/attachments/2013/02/Nginx-logo-2.jpg', 'Logo de Nginx']
categories: ['tutoriales']
tags: ['configuración', 'nginx', 'web']
---

Normalmente, cuando queremos aprender a configurar un sistema desconocido, nos basamos en ejemplos funcionales que vamos modificando y mejorando con el paso del tiempo. Evidentemente, si desconocemos cómo configurar un servicio, es normal que reproduzcamos errores diversos. En este caso, vamos a explicar los errores más comunes que se encuentran en las configuraciones del servidor web Nginx, el cual tiene [una guía de instalación y configuración](http://www.univunix.com/tutoriales/la-gran-evasion-migrar-wordpress-smf-a-nginx/). Como el ejemplo de configuración de la guía anterior tiene algunos errores, pondré una nueva versión aquí, para que podáis ver la diferencia.

### Evita poner el parámetro "root" en cada bloque "location".

Uno de los fallos comunes que puede tener una configuración es el añadir el parámetro "root" a cada bloque "location". Este parámetro indica la ruta de la carpeta donde comienza la raíz del sitio web a mostrar. Si vemos el ejemplo extraído de la wiki:
    
    server {
      server_name www.domain.com;
      location / {
        root /var/www/nginx-default/;
        [...]
      }
      location /foo {
        root /var/www/nginx-default/;
        [...]
      }
      location /bar {
        root /var/www/nginx-default/;
        [...]
      }
    }

Nos damos cuenta de lo siguiente: Añadimos el mismo valor al parámetro en cada sección "location", complicando la legibilidad de la configuración; además, ¿Qué sucede si el cliente entra en una zona no definida? Esto puede causar problemas con el "backend" php (php-fpm, php-cgi), por ejemplo.
    
    server {
      server_name www.domain.com;
      root /var/www/nginx-default/;
      location / {
        [...]
      }
      location /foo {
        [...]
      }
      location /bar {
        [...]
      }
    }

La solución es muy sencilla: pon el parámetro root dentro del bloque "server". Así cualquier bloque "location" tendrá el "root" del servidor concreto y la configuración se interpretará mejor por cualquier persona. Si por casualidad dispones de otras rutas raíz, siempre puedes indicar la raíz en el bloque "location" necesario.

### Evita incluir múltiples directivas de índice.

¿Crees que es necesario poner las mismas directivas en cada una de las secciones?
    
    http {
      index index.php index.htm index.html;
      server {
        server_name www.domain.com;
        location / {
          index index.php index.htm index.html;
          [...]
        }
      }
      server {
        server_name domain.com;
        location / {
          index index.php index.htm index.html;
          [...]
        }
        location /foo {
          index index.php;
          [...]
        }
      }
    }

Ya te respondo directamente. Es completamente innecesario incluirlas en todas partes. Solo basta con indicar la directiva en la sección padre de tu configuración. Es decir, si la sección padre es "http", pones la directiva en "http".
    
    http {
      index index.php index.htm index.html;
      server {
        server_name www.domain.com;
        location / {
          [...]
        }
      }
      server {
        server_name domain.com;
        location / {
          [...]
        }
        location /foo {
          [...]
        }
      }
    }

### No uses sentencias condicionales (if).
#### Redirecciones.

El siguiente ejemplo es una configuración de virtualhost con redirección 301 desde un dominio www a dominio sin www.
    
    server {
      server_name domain.com *.domain.com;
      if ($host ~* ^www\.(.+)) {
        set $raw_domain $1;
        rewrite ^/(.*)$ $raw_domain/$1 permanent;
        [...]
      }
    }

Tenemos tres problemas en el ejemplo. El primero de todos es la sentencia condicional que comprueba el host que solicita el cliente. Desde la wiki de Nginx, indican que el uso de sentencias if son muy negativas para el funcionamiento del servidor, tal como indican en la página "[If is Evil](http://wiki.nginx.org/IfIsEvil)". En términos concretos, indican que Nginx va a estar evaluando la condición por cada petición que realicemos. Esa acción es extremadamente ineficiente y debe evitarse.

La solución es muy sencilla, en ver de hacer un único virtualhost para ambos subdominios, haz dos virtualhost: el que captura el subdominio www retornará un código 301 con el dominio sin www.
    
    server {
      server_name www.domain.com;
      return 301 $scheme://domain.com$request_uri;
    }
    server {
      server_name domain.com;
      [...]
    }

Aparte de evitar usar condicionales innecesarias, se mejora la interpretación de la configuración por parte del usuario.

<div class="alert alert-info">
Nota: El parámetro $scheme hace que la redirección sea por el mismo protocolo que toma del dominio con www.
</div>

#### Peticiones de ficheros.

También evita usar sentencias if en la petición de ficheros. Nginx implementa un método que evita hacer este tipo de comprobaciones.

    server {
      root /var/www/domain.com;
      location / {
        if (!-f $request_filename) {
          break;
        }
      }
    }

Esta es la configuración adecuada, la cual aprovecha la política de comprobación comentada.
   
    server {
      root /var/www/domain.com;
      location / {
        try_files $uri $uri/ /index.html;
      }
    }

**A continuación, veremos una configuración de ejemplo procedente de un tutorial anterior de esta web.**

### Configuración de ejemplo.

Esta es una configuración de ejemplo, en el cual se ha aplicado las prácticas mencionadas.
    
    server {
        server_name  interusers.eu;
        return 301 http://www.interusers.eu$request_uri;
    }
    
    server {
        listen        80;
        server_name    www.interusers.eu;
    
        root        /var/www/interusers/;
        index        index.php;
    
        location = /favicon.ico {
            try_files $uri = 204;
            log_not_found off;
            access_log off;
        }
    
        location = /robots.txt {
            allow all;
            log_not_found off;
            access_log off;
        }
    
        location = /humans.txt {
            allow all;
            log_not_found off;
            access_log off;
        }
    
        location = /readme.html{
            auth_basic "Restricted Access";
            auth_basic_user_file /var/www/interusers/.htpasswd;
        }
    
        location = /wp-config.php {
            return 403;
        }
    
        location = /nginx.conf {
            return 403;
        }
    
        location / {
            try_files    $uri/ $uri /index.php?q=$uri&$args;
            port_in_redirect off;
        }
    
        location ~* ^.+.(jpg|jpeg|gif|css|png|js|ico|xml|htc|swf)$ {
            access_log    off;
            log_not_found    off;
            tcp_nodelay    off;
            expires        max;
            open_file_cache max=1000 inactive=120s;
            open_file_cache_valid 45s;
            open_file_cache_min_uses 2;
            open_file_cache_errors off;
        }
    
        location ~* ^.+.(jpg|jpeg|png|gif|swf)$ {
            valid_referers none blocked interusers.eu www.interusers.eu foro.interusers.eu google.com facebook.com;
                 if ($invalid_referer) {
                    return   403;
                }
        }
    
        location ~ .php$ {
            fastcgi_split_path_info        ^(.+.php)(.*)$;
                fastcgi_pass               backend;
                fastcgi_index              index.php;
                fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
                include fastcgi_params;
                fastcgi_param  QUERY_STRING     $query_string;
                fastcgi_param  REQUEST_METHOD   $request_method;
                fastcgi_param  CONTENT_TYPE     $content_type;
                fastcgi_param  CONTENT_LENGTH   $content_length;
                fastcgi_intercept_errors        on;
                fastcgi_ignore_client_abort     off;
                fastcgi_connect_timeout     60;
                fastcgi_send_timeout         180;
                fastcgi_read_timeout         180;
                fastcgi_buffer_size         128k;
                fastcgi_buffers         256 4k;
                fastcgi_busy_buffers_size     256k;
                fastcgi_temp_file_write_size     256k;
        }
    
        location ~* ^.*(\.(?:git|svn|htaccess|txt|pot?))$ {
            return 404;
        }
    
        #Redirecciones
        #Interno
        location /sections/general/ {
            rewrite /sections/general/ http://www.interusers.eu/sections/otros/ permanent;
        }
        rewrite ^/sitemap\.xml$ /index.php?sitemap=1 last;
        rewrite ^/([^/]+?)-sitemap([0-9]+)?\.xml$ /index.php?sitemap=$1&sitemap_n=$2 last;
        #Tutoriales
        location /t174-windowslinux-como-realizar-un-dual-boot-correcto-en-placas-uefi/ {
            rewrite /t174-windowslinux-como-realizar-un-dual-boot-correcto-en-placas-uefi http://www.interusers.eu/2012/dual-boot-en-placas-base-uefi/ permanent;
        }
    
        location /t155-linux-aprovecha-hardware-viejo-y-montate-un-home-server/ {
            rewrite /t155-linux-aprovecha-hardware-viejo-y-montate-un-home-server http://www.interusers.eu/2012/servidor-en-casa/ permanent;
        }
    
        location /t179-redes-como-montar-una-red-local-para-fibra-movistar-aplicable-a-otros/ {
                    rewrite /t179-redes-como-montar-una-red-local-para-fibra-movistar-aplicable-a-otros http://www.interusers.eu/2012/montar-red-local/ permanent;
        }
    
        location /t81-pc-como-instalar-hardware-con-interfaz-sata-2-en-placas-base-sata-1/ {
            rewrite /t81-pc-como-instalar-hardware-con-interfaz-sata-2-en-placas-base-sata-1 http://www.interusers.eu/2012/instalar-hardware-actual-en-sistemas-antiguos/ permanent;
        }
    
        #Secciones del foro antiguo al nuevo.
        location /f13-baka-area/ {
            rewrite /f13-baka-area http://foro.interusers.eu/offtopic/ permanent;
        }
    
        location /f21-asistencia/ {
            rewrite /f21-asistencia http://foro.interusers.eu/asistencia/ permanent;
        }
        #Fin redirecciones
    }
    
    server {
            listen          80;
            server_name     foro.interusers.eu;
    
            location / {
            return 301 http://www.interusers.eu/foro-cerrado/;    
            }
    }
    server {
            listen 80;
            server_name c1.interusers.eu c2.interusers.eu c3.interusers.eu c4.interusers.eu;
            root            /var/www/interusers-static/;
    
            location ~* ^.+.(jpg|jpeg|gif|css|png|js|ico|xml|htc|swf)$ {
                    access_log      off;
                    log_not_found   off;
                    tcp_nodelay     off;
                    expires         max;
                    open_file_cache max=1000 inactive=120s;
                    open_file_cache_valid 45s;
                    open_file_cache_min_uses 2;
                    open_file_cache_errors off;
            }
    
            location ~* ^.+.(jpg|jpeg|png|gif|swf)$ {
                    valid_referers none blocked www.interusers.eu c1.interusers.eu c2.interusers.eu c3.interusers.eu c4.interusers.eu google.com facebook.com;
                    if ($invalid_referer) {
                            return   403;
                    }
            }
    }
    
    server {
        listen 80 default_server;
        server_name henrietta.interusers.eu;
    
        location / {
            return 403;
        }
    }
    server {
        listen 80;
        server_name mail.interusers.eu;
        return 403;
    }
    
    upstream backend {
        server          127.0.0.1:9000;
    }

### Conclusión

No se han indicado todas las mejoras posibles a realizar en una configuración de Nginx, para no prolongar en exceso el artículo. Pero podéis acceder a todas ellas a través de [la wiki del proyecto](http://wiki.nginx.org/Pitfalls) (en Inglés), el cual ha sido fuente para realizar este tutorial. Espero que os haya servido.
