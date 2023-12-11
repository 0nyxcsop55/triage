@echo off
title SIMPLE TRIAGE

echo --------------------------------------------------------
echo      ####### ######  ###    #     #####  #######        
echo         #    #     #  #    # #   #     # #              
echo         #    #     #  #   #   #  #       #      	      
echo         #    ######   #  #     # #  #### #####          
echo         #    #   #    #  ####### #     # #              
echo         #    #    #   #  #     # #     # #              
echo         #    #     # ### #     #  #####  #######        				      
echo  ####### ####### #####  ####### #     #  #####  ####### 
echo  #       #     # #    # #       ##    # #     # #       
echo  #       #     # #    # #       # #   # #       #       
echo  #####   #     # #####  #####   #  #  #  #####  #####   
echo  #       #     # #  #   #       #   # #       # #       
echo  #       #     # #   #  #       #    ## #     # #       
echo  #       ####### #    # ####### #     #  #####  ####### 
echo 							     By Onyx
echo --------------------------------------------------------
                                                                                                                                            
echo "COMENZARA EL PROCESO DE RECOPILACION DE DATOS"

echo RECOPILANDO EVENTOS DEL SISTEMA
wevtutil qe System /f:text >  %computername%_EventosSistema.txt
echo DATOS RECOPILADOS

echo RECOPILANDO EVENTOS DE APLICACIONES
wevtutil qe Application /f:text >  %computername%_EventosAplicaciones.txt
echo DATOS RECOPILADOS

echo RECOPILANDO EVENTOS DE INSTALACION
wevtutil qe Setup /f:text >  %computername%_EventosInstalacion.txt
echo DATOS RECOPILADOS

echo RECOPILANDO INFORMACION DE CONEXIONES Y PUERTOS
netstat -ano >  %computername%_ConexionesyPuertos.txt
echo DATOS RECOPILADOS

echo RECOPILANDO INFORMACION TABLA ARP
arp -a > %computername%_TablaARP.txt
echo DATOS RECOPILADOS

echo RECOPILANDO INFORMACION DEL SISTEMA
systeminfo > %computername%_InfoSistema.txt
echo DATOS RECOPILADOS

echo RECOPILANDO INFORMACION DE VERSION DE WINDOWS
ver > %computername%_InfoPc.txt
echo DATOS RECOPILADOS

echo RECOPILANDO INFORMACION DE RED
ipconfig /all > %computername%_InfoNet.txt
echo DATOS RECOPILADOS

echo RECOPILANDO INFORMACION DE USUARIOS LOCALES
net user > %computername%_InfoUser.txt
echo DATOS RECOPILADOS

echo RECOPILANDO INFORMACION DE APLICACIONES INSTALADAS
wmic product get name,version > %computername%_Aplicaciones.txt
echo DATOS RECOPILADOS

echo RECOPILANDO INFORMACION DE ULTIMAS CONEXIONES
ipconfig /displaydns > %computername%_UltimasConxeciones.txt
echo DATOS RECOPILADOS

echo RECOPILANDO INFORMACION DE PROCESOS
tasklist /fi "USERNAME ne NT AUTHORITY\SYSTEM" /fi "STATUS eq running" /FO TABLE > %computername%_TaskList.txt
echo DATOS RECOPILADOS

echo RECOPILANDO INFORMACION DE POLITICAS DE GRUPO
gpresult /R > %computername%_PoliticasDeUsuario.txt
echo DATOS RECOPILADOS

echo "PRESIONE CUALQUIER TECLA PARA SALIR"
pause
