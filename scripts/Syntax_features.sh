echo Hello world!

echo 'line';

echo $Variable;

echo ${Variable};

echo ${Variable/Some/A}
#This will substitute thefirst occurence of "Some" with "A"

Len=7
echo ${Variable:0:Length}

echo ${Foo:-"DefaultIfFooIsMissingOrEmpty"}

echo {1..10}
#brace expansion

echo {a..z}
#generate letters

echo "Last program's return value: $?"
echo "Script's PID: $$"
echo "Number of arguments passed to script: $#"
echo "All args passed: $@"
echo "Aguments variables: $1 $2..."

read NAME
echo Hello, $NAME!

if [ $NAME != $USER ]
then
    echo "Your name is not username"
else
    echo "Your name is your username"
fi

#ecran with quotes is safe if $NAME is empty
if [ "$NAME" != $USER]

echo "Always exec" || echo "Exec if 1st fails"
echo "Always exec" && echo "Exec if first runs"

if [ "$NAME" == "Steve"] && [ "$AGE" -eq 15 ]
then
    echo "This will run if $NAME is Steve AND $AGE is 15"
fi

if [ "$NAME" == "DANYA" ] || [ "$NAME" == "VASYA"]

echo $(( 10 + 5 ))

#Bash is shell and work in directory context

case "$Variable" in
    0) echo "Zero";;
    1) echo "One";;
    *) echo "Not null";;
esac

for Variable in {1..3}
do
    echo "$Variable"
done

for ((a=1; a <= 3; a++))
do
    echo $a
done

for Variable in file1 file2
do
    cat "$Variable"
done

for Output in $(ls)
do
    cat "$Output"
done

#Loop through array of elements
#firstmethod
ARR=( "1" "2" "3" )
for I in ${ARR[@]}
do
    echo $I
done

declare -a ARR=("string" "String2" "String3")
for I in "${arr[@]}"
do 
    echo "$I"
done