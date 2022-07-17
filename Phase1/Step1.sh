tar -tvf ../Data/Original/campus_complete.tar > filelist.txt
g++ ./Step1Registration/main.cpp -fopenmp -o ./Step1Registration/SampleReg.out

declare -i file_index=0

while read line; do
	if [[ "${line:0:1}" == "-" ]]; then
		filename="${line##* }";
		extension="${filename##*.}";
		if [[ "$extension" == "txt" ]]; then
		        filename="${filename%.*}";
	                echo "Processing ${filename}...";
                	tar -xf ../Data/Original/campus_complete.tar "${filename}.dat"
	                tar -xf ../Data/Original/campus_complete.tar "${filename}.txt"
			./Step1Registration/SampleReg.out ./"${filename}" ../Data/Phase1/Step1/data_"${file_index}".txt
			rm "${filename}.dat"
			rm "${filename}.txt"
        	        ((file_index += 1))
			#exit; #comment this line when debug is done
		fi;
	fi;
done < filelist.txt

echo "$file_index files processed."
rm filelist.txt

