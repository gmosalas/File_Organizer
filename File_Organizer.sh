#add the shebang
#!/bin/bash

# organize files in the source directory by moving them to separate directories based on their file extensions in the destination directory.

#read the source directory path from user
echo "Enter the source directory path: "
read source_dir

#read the destination directory path from user 
echo "Enter the destination directory path: "
read dest_dir

#check if the source directory alredy exists 
if [ ! -e "$source_dir" ]; then
	echo "Path does not exist"
	exit 1
fi

#Check if the destination directory exists. If not, create it.
if [ ! -e "$dest_dir" ]; then
	mkdir -p $dest_dir
fi

#Get a list of all files in the source directory.
file_list=$(ls "source_dir")

#For each file in the list:
for file in file_list; do
	#Get the file extension.
	extension="${file##*.}"

	#Create a target directory based on the file extension in the destination directory.
	target_dir="$dest_dir/$extension"

	#Check if the target directory exists. If not, create it.
	if [ ! -d "$target_dir" ]; then
		mkdir -p "$target_dir"
	fi

	#Move the file from the source directory to the target directory.
	mv "$source_dir/$file" "$target_dir/"
done

#Display a message indicating the successful organization of files.
echo "Files organized successfully!"

