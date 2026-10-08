#!/bin/bash
stored_password="12"
attempt=0
max_attempt=3

mkdir -p logs
touch logs/system.log
sys_menu(){

    echo "=================================="
    echo "      System Info toolbox         "
    echo "=================================="
    echo " 1. Show OS information"
    echo " 2. Show CPU information"
    echo " 3. Show RAM information"
    echo " 4. Show disk usage"
    echo " 5. Show current directory" 
    echo " 6. Exit"
    
} 
login(){
    while [ $attempt -lt $max_attempt ]
    do
     read -sp "Enter your Password: " password 
     echo
      
        if [ "$password" = "$stored_password" ]; then
            echo "Access Granted" 
            logfile "Login Successful"
            break
        else
            attempt=$(( attempt + 1 ))
            echo "Access Denied wrong password ($attempt/$max_attempt)"
            logfile "Login failed"
        fi

        if [ $attempt -eq $max_attempt ]; then
          echo " Too many treis. Program closing"
          exit 0
        fi
    done      
}
logfile(){
    echo "$(date) - Selected option: $1" >> system.log
}

osinfo(){
    systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
    logfile "Osinfo fetched"
}
 
cpuinf(){
    powershell.exe -Command "Get-CimInstance Win32_Processor | Select-Object -ExpandProperty Name"
    logfile " CPU info fetched"
}
raminf(){
    powershell.exe -Command "Get-CimInstance Win32_ComputerSystem | Select-Object TotalPhysicalMemory"
    logfile "RAM info fetched"
    }
diskus(){
    powershell.exe -Command "Get-CimInstance Win32_LogicalDisk | Select-Object DeviceID,Size,FreeSpace"
    logfile "DISK info fetched"
}
currentdirc(){
    pwd
    logfile "Current directory fetched"
}
quit_menu(){
 echo "Exiting....."
 logfile " Program closed"
 exit 0
}

login
while true
do
 
    clear
    sys_menu
    read -p "Enter your choice: " choice

    case "$choice" in

      1) osinfo ;;
      2) cpuinf ;;
      3) raminf ;;
      4) diskus ;;
      5) currentdirc ;;
      6) quit_menu ;;
      *) echo "Enter a valid choice"
    esac 
     read -p "Press enter to continue....."
done
