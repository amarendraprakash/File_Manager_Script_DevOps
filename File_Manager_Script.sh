#!/bin/bash

show_menu() {
 echo "================================================================="
 echo "                     File Manager Script                         "
 echo "================================================================="
 echo "1. Create a file"
 echo "2. Create a directory"
 echo "3. List files and directory"
 echo "4. Delete a file"
 echo "5. Delete a directory"
 echo "6. Exit"
 echo "================================================================="
}

create_file() {
 read -r -p "Enter the file name to create: " file_name
 if [[ -e "$file_name" ]]; then
   echo "File already exists"
 else
   touch "$file_name"
   echo "File $file_name created successfully"
 fi
}

create_directory() {
 read -r -p "Enter the directory name to create: " directory_name
 if [[ -d "$directory_name" ]]; then
   echo "Directory already exists"
 else
   mkdir "$directory_name"
   echo "Directory $directory_name created successfully"
 fi
}

list_item() {
 echo "Listing files and directories in pwd $(pwd): "
 ls -l
}

delete_file() {
 read -r -p "Enter the file name you want to delete: " file_name
 if [[ -e "$file_name" ]]; then
   rm "$file_name"
   echo "File $file_name deleted successfully"
 else
   echo "File does not exist"
 fi
}

delete_directory() {
 read -r -p "Enter the directory name you want to delete: " directory_name
 if [[ -d "$directory_name" ]]; then
   rm -r "$directory_name"
   echo "Directory '$directory_name' deleted successfully"
 else
   echo "Directory does not exist"
 fi
}

while true; do
  show_menu
  read -r -p "Enter your choice [1-6]: " choice
  case $choice in
    1) create_file;;
    2) create_directory;;
    3) list_item;;
    4) delete_file;;
    5) delete_directory;;
    6) echo "Exiting script !! Goodbye"; exit 0;;
    *) echo "Invalid choice please enter a number between 1 to 6";;
  esac
done
