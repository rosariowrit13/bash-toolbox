menu() {
    echo "_ _ _MENU_ _ _"
    echo "1.Show Date"
    echo "2.Show Files"
    echo "3.Bacukup text"
    echo "4.Show current folder"
    echo "5.Exit"
    read -p "Enter your choice: " choice
}

show_date(){
    date
}

show_files(){
    ls
}

backup_text(){
    today=$(date +%F)
    folder="backup_$today"

    mkdir -p backup_"$today"
    
    for file in *.txt; 
    do
        if [ -f "$file" ]; 
        then
            cp "$file" "$folder/"
        fi
    done
}

current_folder(){
    pwd
}

quit_menu(){
    echo "Exiting..."
    exit 0
}

while true;
do
   menu 
      case "$choice" in
         1) show_date ;;
         2) show_files ;;
         3) backup_text ;;
         4) current_folder ;;
         5) quit_menu ;;
         *) echo "Invalid choice" ;;
    esac
done