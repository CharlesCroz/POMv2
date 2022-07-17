tar -xf ../Data/Original/campus_complete.tar scan033.txt
tar -xf ../Data/Original/campus_complete.tar scan033.dat
echo "19135426" > scanX.txt
mv scan033.dat scanX.dat
cat scan033.txt >> scanX.txt
./Step1Registration/SampleReg.out scanX ../Data/Phase1/Step1/data_7.txt
rm scan033.txt
rm scanX.*
