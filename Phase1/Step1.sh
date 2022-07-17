tar -tvf ../Data/Original/campus_complete.tar > filelist.txt

declare -i file_index=0

while read line; do
	if [[ "${line:0:1}" == "-" ]]; then
		filename="${line##* }";
		extension="${filename##*.}";
		if [[ "$extension" == "txt" ]]; then
		        filename="${filename%.*}";
	                echo "Processing ${filename}...";
                	tar -xf ../Data/Original/campus_complete.tar "${filename}.dat"
	                #tar -xf ../Data/Original/campus_complete.tar "${filename}.txt"
			echo "${filename}.dat + ${filename}.txt into data_${file_index}.txt"
			rm "${filename}.dat"
			#rm "${filename}.txt"
        	        ((file_index += 1))
			exit; #comment this line when debug is done
		fi;
	fi;
done < filelist.txt

echo "$file_index files processed."
rm filelist.txt

