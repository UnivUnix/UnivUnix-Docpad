---
author: Aglezabad
comments: true
date: 2013-02-03 21:30:48+00:00
layout: post
slug: la-gran-evasion-migrar-wordpress-smf-a-nginx
title: 'La gran evasión: Migrar Wordpress a Nginx'
wordpress_id: 95
categories:
- Debian
- Tutoriales
following_users:
- Aglezabad
- Ferthedems
tags:
- Debian
- Nginx
- PHP
- SMF
- Web
- Wordpress
---

[![La gran evasión de Apache](http://www.univunix.com/wp-content/uploads/lagranevasiónapache-300x182.jpg)](http://www.univunix.com/wp-content/uploads/lagranevasiónapache.jpg)Todos buscamos un mejor rendimiento en nuestro servidor, para dar una web rápida, fiable y con un bajo consumo de memoria. Estando en Apache, siempre aprovechamos de alguna forma el intentar optimizar la configuración y los tiempos de respuesta entre otros; pero nunca hemos planteado cambiar el servidor por otro que se ajuste a nuestras exigencias. Para ello, basta con buscar en Internet las comparativas necesarias y dar un juicio al respecto. El artículo que dió mi postura de cambio fue por parte de la web whisperdale.net, quienes hacían una [comparativa entre los servidores web libres/opensource](http://www.whisperdale.net/11-nginx-vs-cherokee-vs-apache-vs-lighttpd.html) más conocidos (por eso no está ISS presente): Apache, Nginx, Lighttpd y Cherokee.

La **conclusión del artículo** era la siguiente: **Nginx tenía mayor rendimiento a nivel general**, sobre todo con varios clientes conectados de forma simultánea; mientras que Lighttpd quedaba en segundo puesto, con resultados similares. Por otra parte, Apache quedó en la última posición. A pesar de los resultados, **Apache es el servidor web más usado**, ya que es sencillo de configurar para los sitios que usan PHP.

El único inconveniente que tiene Nginx como servidor único en Wordpress es la ausencia de módulos preconfigurados que procesen los ficheros php; pero tras hallar [este artículo de Daniel Miessler](http://danielmiessler.com/blog/optimizing-wordpress-with-nginx-varnish-w3-total-cache-amazon-s3-and-memcached), en el cual usa Nginx y Varnish para mejorar su página web hecha en Wordpress, el argumento comentado carece de validez.

Él, en su caso, usó Ubuntu como distribución base para el servidor, por lo que aplicar esa guía para otras distribuciones puede variar. En mi caso, yo utilizo **Debian squeeze** (la versión estable del momento), por lo que difiere ligeramente el método.


### Índice


Este tutorial se compone de las siguientes secciones:



	
  * Desinstalación de Apache.

	
  * [Instalación de Nginx y el paquete php-fpm.](linux/la-gran-evasion-migrar-wordpress-smf-a-nginx/2/)

	
  * [Configuración de Nginx.](linux/la-gran-evasion-migrar-wordpress-smf-a-nginx/3/)

	
  * [Migración de la web.](/linux/la-gran-evasion-migrar-wordpress-smf-a-nginx/4/)


<!-- more -->


### Desinstalación de Apache


Esta es la parte más sencilla de todas, vamos a desinstalar el paquete apache2 y sus asociados, los cuales podemos encontrar con:

    
    # aptitude search apache


Para facilitar la tarea, los paquetes a desinstalar están presentes en el siguiente comando:

    
    # aptitude remove apache2 apache2-dev apache2-mpm apache2.2-bin apache2.2-common


Esto desinstalará Apache, para evitar conflictos de puertos en el servidor. No borro las configuraciones por si nos interesa volver a Apache por cualquier motivo. En caso contrario, si estás seguro de permanecer en Nginx, puedes sustituir "remove" por "purge". También hay que tener en cuenta que el nombre de algunos paquetes puede variar, dependiendo de los repositorios no oficiales que tengas en uso. **En [la página siguiente](/linux/la-gran-evasion-migrar-wordpress-smf-a-nginx/2/), explicaremos la instalación de Nginx** y los módulos php necesarios.




### Instalación de Nginx y del módulo php-fpm


[![Nginx-logo](http://www.univunix.com/wp-content/uploads/Nginx-logo-300x115.jpg)](http://www.univunix.com/wp-content/uploads/Nginx-logo.jpg)Aquí tendremos alguna complicación, y es porque **el paquete php-fpm** que explica Daniel **no está disponible en los repositorios oficiales de Debian** (con el nombre php5-fpm), así que tenemos que recurrir a un repositorio externo. Hay algo de intriga en usar repositorios externos porque puede haber incompatibilidades con el resto de paquetes (ej: paquetes de la rama wheezy en squeeze o sucesos similares) pero no hay inconveniente, ya que es un **repositorio exclusivo de la versión squeeze**.

Por algún casual os ha debido de sonar [dotdeb.org](http://www.dotdeb.org), el autonombrado "repositorio de servidores LAMP Debian". Si no os suena, he de decir que es un repositorio cuyo objetivo es mantener las últimas versiones estables de programas de servidor como mysql-server, apache, el propio nginx, y diversos módulos php. Son los mismos paquetes que te encuentras en el repositorio oficial, pero su tiempo de renovación de paquetes es menor (sale antes una nueva versión en dotdeb que en el oficial, eso es obvio), y por ello, son versiones más avanzadas.

Lo primero que hay que hacer es añadir su repositorio a nuestro sources.list. Para ello, tiramos de nano, vi o emacs (el editor que tengas más cariño) y en sesión root:

    
    # nano /etc/apt/sources.list


Y añadimos estas líneas al archivo:

    
    deb http://packages.dotdeb.org squeeze all
    deb-src http://packages.dotdeb.org squeeze all


Y solicitamos la clave GPG al servidor de llaves (en este caso, es dotdeb.org):

    
    wget http://www.dotdeb.org/dotdeb.gpg
    cat dotdeb.gpg | sudo apt-key add -


Y con ello tendríamos añadido el repositorio. Si por un casual queremos cambiar el servidor de dotdeb y poner cualquiera de los servidores espejo disponibles, solo basta con ver[ la lista de servidores](http://www.dotdeb.org/mirrors/). Y si quieres tener php5.4, en lugar de php5.3, en su [página de instrucciones](http://www.dotdeb.org/instructions/) podrás seguir los pasos (en Inglés).

Hacemos un update para actualizar la lista de paquetes, realizamos las actualizaciones necesarias e instalamos Nginx y php5-fpm:

    
    # aptitude update
    # aptitude dist-upgrade
    # aptitude install nginx php5-fpm


**En [la próxima página](/linux/la-gran-evasion-migrar-wordpress-smf-a-nginx/3/), procedemos a la configuración de Nginx**, para dejarlo en funcionamiento.



### Configurar el servidor Nginx


A continuación, hay que configurar nginx, de tal forma que podamos activar las fncionalidades que queramos. Os mostraré un ejemplo, el cual es una vieja configuración del servidor. El mismo está basado en la configuración de Daniel Miessler, con retoques míos y de otras configuraciones, como la de perusio ([aquí tenéis su repositorio en github](https://github.com/perusio/wordpress-nginx), con diversas configuraciones):

    
    user www-data;
    worker_processes 4; #2*nº núcleos CPU
    pid /var/run/nginx.pid;
    worker_rlimit_nofile 20000;
    
    events {
        worker_connections 20000;
        use epoll;
        multi_accept on;
    }
    
    http {
    
        ##
        # Basic Settings
        ##
    
        sendfile on;
        tcp_nopush on;
        tcp_nodelay on;
        keepalive_timeout 5;
        types_hash_max_size 2048;
        server_tokens off;
    
        # server_names_hash_bucket_size 64;
        # server_name_in_redirect off;
    
        include /etc/nginx/mime.types;
        default_type application/octet-stream;
    
        ##
        # Logging Settings
        ##
    
        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;
    
        ##
        # Gzip Settings
        ##
    
        gzip on;
        gzip_disable "MSIE [1-6].(?!.*SV1)";
    
        gzip_vary on;
        gzip_proxied any;
        gzip_comp_level 9;
        gzip_buffers 16 8k;
        gzip_http_version 1.1;
        gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;
        gzip_static on;
    
            #Timeouts
            client_body_timeout     60;
            client_header_timeout   60;
            send_timeout            60;
    
            reset_timedout_connection on;
    
        ##
        # Virtual Host Configs
        ##
    
        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
    }


La configuración, evidentemente, puede variar para cada caso, pero siempre puedes acceder a la wiki de nginx, al repositorio de perusio para guiarte en tu modificación. **[A continuación](/linux/la-gran-evasion-migrar-wordpress-smf-a-nginx/4/), procederemos a configurar nuestro sitio y a trasladarlo a Nginx de la forma menos traumática.**




### Migración de la web


Este es un paso relativamente sencillo, ya que solamente nos queda configurar el dominio virtual a cada web que tengamos. En vez de estar un buen rato explicando para qué sirve cada una de las opciones, os dejo una configuración modelo, que servirá como base. **Esta configuración hay que crearla en /etc/nginx/sites-available/<nombre del sitio>.**

    
    server {
        listen        80; #Puerto de escucha de la web
        server_name    www.interusers.eu; #Nombre de la web. Si tienes varias webs, esto hace que las diferenciemos por el nombre. #Es igual que los "virtual servers" de Apache.
        root        /var/www/interusers/; #Ruta hacia la carpeta donde se aloja la web.
        index        index.php; #La primera página a leer.
    
        location = /favicon.ico { 
            try_files $uri = 204;
            log_not_found off; #Con esto, evitamos agrandar el log, impidiendo que registre los errores 404 a este fichero.
            access_log off; #Con esto, evitamos agrandar el log, impidiendo que registre los accesos a este fichero.
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
            auth_basic "Restricted Access"; #Así es como podemos hacer un acceso básico por contraseña en Nginx.
            auth_basic_user_file /var/www/interusers/.htpasswd;
        }
    
        location = /wp-config.php {
            return 403; #Si queremos restringir un archivo, basta con retornar el código de error.
        }
    
        location = /nginx.conf {
            return 403;
        }
    
        location / {
            root        /var/www/interusers/;
            index        index.php;
            try_files    $uri/ $uri /index.php?q=$uri&$args;
            port_in_redirect off;
        }
    
        location ~* ^.+.(jpg|jpeg|gif|css|png|js|ico|xml|htc|swf)$ {
            access_log    off;
            log_not_found    off;
            tcp_nodelay    off;
            expires        max;
            root        /var/www/interusers/;
            open_file_cache max=1000 inactive=120s;
            open_file_cache_valid 45s;
            open_file_cache_min_uses 2;
            open_file_cache_errors off;
        }
    
        location ~* ^.+.(jpg|jpeg|png|gif|swf)$ { #Esto sirve para evitar el hotlinking de nuestros contenidos, ayudando a la reducción de consumo de las transferencias de datos.
            valid_referers none blocked interusers.eu www.interusers.eu foro.interusers.eu google.com facebook.com;
                 if ($invalid_referer) {
                    return   403;
                }
        }
    
        location ~ .php$ { #Configuración php (fastcgi).
            fastcgi_split_path_info        ^(.+.php)(.*)$;
                fastcgi_pass               backend;
                fastcgi_index              index.php;
                fastcgi_param  SCRIPT_FILENAME  /var/www/interusers/$fastcgi_script_name;
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
        #Interno #Con esto, realizamos redirecciones usando rewrite. Concretamente, las permament son redirecciones 301.
        location /sections/general/ {
            rewrite /sections/general/ http://www.interusers.eu/sections/otros/ permanent;
        }
        rewrite ^/sitemap_index\.xml$ /index.php?sitemap=1 last;
        rewrite ^/([^/]+?)-sitemap([0-9]+)?\.xml$ /index.php?sitemap=$1&sitemap_n=$2 last;
        #Fin redirecciones
    }


Como dije en el capítulo anterior, estas son configuraciones que hice basándome en la configuraciones hechas por Daniel Miessler y Perusio. Concretamente, esta es parte de la configuración de mi (Aglezabad) web personal, [Interusers](http://www.interusers.eu). Reitero que esto una configuración modelo y puede tener sus errores y posibles mejoras, la intención es otorgar una base. Para lo demás, está la wiki de Nginx.

Para activar el servidor virtual, creamos un enlace simbólico del archivo apuntando a la carpeta "sites-enabled". Después, hacemos una recarga de la configuración.

    
    # ln -s /etc/nginx/sites-available/<nombre del sitio> /etc/nginx/sites-enabled/<nombre del sitio>
    # service nginx reload




Y, por fin, ya tendremos nuestra web o blog hecho en Wordpress bajo el amparo de Nginx. Espero que os sirva de utilidad esta pequeña guía para tener una base y desarrollar vuestro camino en la configuración de una web. **Si tenéis alguna duda, ahí tenéis el [foro](http://www.univunix.com/forum), donde os ayudaremos en todo lo posible.**
