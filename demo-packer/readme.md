# PACKER DEMO
En esta demo se creara una AMI para AWS con una llave publica personalizada y con docker. En esta demo se asumirá que ya tienes una cuenta de AWS previamente creada.

Crear un usuario en tu cuenta de AWS y obtener las credenciales (secret_id y secret_key) de AWS.
Configurar las credenciales como variables de entorno.
```
    export AWS_ACCESS_KEY=""
    export AWS_SECRET_KEY=""
```
ó
     https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html

Dentro del directorio scripts se encuentra la llave publica que se agregara a la imagen base resultante. Por cuestiones se seguridad no se encuentra la llave privada por lo que se sugiere que se cree un set de llaves y se remplace el contendido del archivo scripts/packer-key.pub por el valor de llave publica generada (.pub). Para generar el set de llaves puedes seguir las siguientes instrucciones:

``` 
    ssh-keygen -f ~/.ssh/packer-key -t rsa
```

Este comando generará 2 archivos "packer-key" que contiene la llave privada y "packer-key.pub" que contiene la llave publica, el contenido de esta es el que e reemplazara en el archivo "scripts/packer-key.pub" dentro de esta carpeta.

Selecione la AMI de ubuntu 18 lts creada por aws
aws-parallelcluster-2.5.1-ubuntu-1804-lts-hvm-201912111004

Para validar la sintaxis del archivo de definición que contiene todas las configuraciones necesarias se ejecutará el siguiente comando:
```
    packer validate aws-ami.json
```

Finalmente se procede a crear el AMI en la cuenta de AWS configurada previamente. y para ello es necesario ejecutar el siguiente commando

```
    packer build aws-ami.json
```

Log guardados en build.log
