#!/usr/bin/bash

#set default dates
start_date="2023-01-01"
end_date="2023-01-01"


func() {
  while true; do
    read -p "$1 (y/n): " choice
    case "$choice" in
      [Yy]) return 0 ;;
      [Nn]) return 1 ;;
      *) echo "Invalid choice. Please enter 'y' for yes or 'n' for no." ;;
    esac
  done
}


if func "Do you want to change the start date?"; then
  read -p "Enter the new start date (YYYY-MM-DD): " start_date
fi

if func "Do you want to change the end date?"; then
  read -p "Enter the new end date (YYYY-MM-DD): " end_date
fi


images1=$(find . -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" \) -newermt "$start_date" ! -newermt "$end_date")


file_count=$(echo "$images1" | wc -l)


echo "Image files found between $start_date and $end_date:"
echo "$images1"
echo "Total files found: $file_count"
