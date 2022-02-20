#!/bin/bash

# You have to run this script in the same dir than the songs.


# To do : if not in /usr/local/bin/id3tool install
# To do : if not in /usr/local/bin/id3tag install

set -e

songs_array=($(ls *.mp3 | sort))



Choose_List()
{



read -p "Enter a number between 1 and 7 : " answer

 case "$answer"  in 
	1) Title_Name
	;;
	2) Artist_Name
	;;
	3) Album_Name
	;;
	4) Year
	;;
	5) Track_nb
	;;
	6) Total_Album_Track_Nb
	;;
	7) Genre
	;;
	8) Exit
	;;
	*) echo -e "\n\n No !! \n Please select a number between 1 and 7 !! \n\n" && Choose_List 
esac 
}

## FUNCTIONS


Exit()
{
	
	clear
}


Title_Name()
{
	clear
	echo "####################################"
	#ls *.mp3 | sed -E "s/[[:space:]]+/_/g" | sort
	# echo ${songs_array[@]}  
    

	for i in "${!songs_array[@]}"
	do 
	  printf  "%s\t%s\n" "$i" "${songs_array[$i]}"
	done


	echo "####################################"
    echo ""
	read -p "Which song ?"  answer_song_selected
	echo "You selected: " ${songs_array[$answer_song_selected]}



	Choose_List2()
{


echo "What do you want to edit ?"
echo ""
echo "1 - Title ?"
echo "2 - Artist / Band name  ?"
echo "3 - Album name  ?"
echo "4 - Year ?"
echo "5 - Track number ?"
echo "6 - Album Total track number ?"
echo "7 - Genre ?"
echo ""
echo "8 - Exit ?"
echo ""
read -p "Enter a number between 1 and 8 : " answer
 case "$answer"  in 
	1) Title_Name2
	;;
	2) Artist_Name2
	;;
	3) Album_Name2
	;;
	4) Year2
	;;
	5) Track_nb2
	;;
	6) Total_Album_Track_Nb2
	;;
	7) Genre2
	;;
	8) Exit
	;;
	*) echo -e "\n\n No !! \n Please select a number between 1 and 7 !! \n\n" && Choose_List 
esac 
}


Choose_List2

Title_Name2()
{
    read -p "Which Title name you want for ${songs_array[$answer_song_selected]}: " answer_title_Name
    id3tag -s $answer_title_Name ${songs_array[$answer_song_selected]}
    echo "------------------------------------------"
    id3tool ${songs_array[$answer_song_selected]}

}



	sleep 5
	clear
	echo "Everything went fine, you will go back to the Menu"
	sleep 2
	clear
	default_songs_list
	Choose_List

}





Artist_Name()
{
	clear
	echo "####################################"
	ls *.mp3 | sed -E "s/[[:space:]]+/_/g"
	echo "####################################"
	echo ""
	read -p "Which Artist Name would like to have for all the above songs ?" answer_Artist_Name
	echo ""
	echo "All the above songs will have their Metadata edited with \"$answer_Artist_Name\""
	echo ""
	read -p "READY ??" ready
    for i in $(ls *.mp3 | sed -E "s/[[:space:]]+/_/g")
	do
		id3tag -a $answer_Artist_Name $i
		echo "------------------------------------------"
		id3tool $i
		echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/"
		echo ""
		echo ""
	done
}	

Album_Name()
{
	clear
	echo "####################################"
	ls *.mp3 | sed -E "s/[[:space:]]+/_/g"
	echo "####################################"
	echo ""
	read -p "Which Album Name would like to have ?" answer_Album_Name
	echo ""
	echo "All the above songs will have their Metadata edited with \"$answer_Album_Name\""
	echo ""
	read -p "READY ??" ready
    for i in $(ls *.mp3 | sed -E "s/[[:space:]]+/_/g")
	do
		id3tag -A $answer_Album_Name $i
		echo "------------------------------------------"
		id3tool $i
		echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/"
		echo ""
		echo ""
	done
}

Year()
{
	clear
	echo "####################################"
	ls *.mp3 | sed -E "s/[[:space:]]+/_/g"
	echo "####################################"
	echo ""
	read -p "Which year those songs where produce (Enter 4 digits eg: 2020)?" answer_Year
	echo ""
	echo "All the above songs will have their Metadata edited with \"$answer_Year\""
	echo ""
	read -p "READY ??" ready
    for i in $(ls *.mp3 | sed -E "s/[[:space:]]+/_/g")
	do
		id3tag -y $answer_Year $i
		echo "------------------------------------------"
		id3tool $i
		echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/"
		echo ""
		echo ""
	done
}

Track_nb()
{
	# need array
	clear
	echo "####################################"
	ls *.mp3 | sed -E "s/[[:space:]]+/_/g"
	echo "####################################"
	echo ""
	read -p "Which Track nb ?" answer_Track_nb
	echo ""
	echo "All the above songs will have their Metadata edited with \"$answer_Track_nb\""
	echo ""
	read -p "READY ??" ready
    for i in $(ls *.mp3 | sed -E "s/[[:space:]]+/_/g")
	do
		id3tag -t $answer_Track_nb $i
		echo "------------------------------------------"
		id3tool $i
		echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/"
		echo ""
		echo ""
	done
}

Total_Album_Track_Nb()
{
	clear
	echo "####################################"
	ls *.mp3 | sed -E "s/[[:space:]]+/_/g"
	echo "####################################"
	echo ""
	read -p "Total number of tracks for the Album ?" answer_Total_Album_Track_Nb
	echo ""
	echo "All the above songs will have their Metadata edited with \"$answer_Total_Album_Track_Nb\""
	echo ""
	read -p "READY ??" ready
    for i in $(ls *.mp3 | sed -E "s/[[:space:]]+/_/g")
	do
		id3tag -T $answer_Total_Album_Track_Nb $i
		echo "------------------------------------------"
		id3tool $i
		echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/"
		echo ""
		echo ""
	done
}

Genre()
{
 	clear
 	echo "So you want to edit the GENRE of all the songs in the Directory ?"
 	read -p "Press enter to see all the GENRES" answer_Genre1
 	# id3tool -l | tail -n +3 | cat -b
 	clear
 	echo "So you want to edit the GENRE of all the songs in the Directory ?"
 	cat -b genre.txt 
 	echo ""

 	Choose_Genre




	
	
#    for i in $(ls *.mp3 | sed -E "s/[[:space:]]+/_/g")
#	do
#		#id3tag -g $((answer_Genre2-1)) $i
#		#id3tool -l | awk 'NR == 144' | awk '{$NF=""}1'| awk '{$NF=""}1' > genre_save
#		id3tool -l | awk 'NR == 144' | $cut -d "delimiter" -f > genre_save
#		id3tag -g genre_save $i
#		echo "------------------------------------------"
#		id3tool $i
#		echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/"
#		echo ""
#		echo ""
#	done
}


Choose_Genre()
{	
	

	read -p "Select the left number of the GENRE that you want: " answer_Genre2
    clear
 	echo "All the songs below will have their Metadata edited with this genre which is Genre Metadata : \"$answer_Genre2\""
 	echo ""
 	echo ""
 	ls *.mp3 | sort -n

	echo ""
	read -p "READY ?? if Yes press Enter" ready



	case "$answer_Genre2"  in 
	1) for i in $(ls *.mp3 | sed -E "s/[[:space:]]+/_/g")
	do
		id3tag -g answer_Genre2 $i
		echo "------------------------------------------"
		id3tool $i
		echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/"
		echo ""
		echo ""
	done
	;;
	2) 
	;;
	3) 
	;;
	4) 
	;;
	5) 
	;;
	6) 
	;;
	7) 
	;;
	8) 
	;;
	9) 
	;;
	10) 
	;;
	11) 
	;;
	12) 
	;;
	13) 
	;;
	14) 
	;;
	15) 
	;;
	16) 
	;;
	17) 
	;;
	18) 
	;;
	19) 
	;;
	20)
	;;
	*) echo -e "\n\n No !! \n Please select a number between 1 and 20 !! \n\n" && Choose_Genre
esac 
}


clear

echo ""
echo ""
echo ""
echo "Hi !! So you want to edit the Metadata of all the files in this `pwd` directory?"
echo ""
echo "The list of the songs are below:"
echo ""
echo "####################################"

## Reformat file name

for f in *; do mv "$f" `echo $f | tr ' ' '_'`; done 2>/dev/null
for f in *; do mv "$f" `echo $f | tr '-' '_'`; done 2>/dev/null


default_songs_list(){
ls *.mp3 | sed -E "s/[[:space:]]+/_/g"
echo "####################################"
echo ""
echo "You have a total of" `ls *.mp3 | sort | wc -l` "songs"
echo ""
echo ""
echo "What do you want to edit ?"
echo ""
echo ""
echo "##########################################################"
echo "1 - All Metadata for one song only (not the file name)?"
echo ""
echo "2 - Artist / Band name only (for all the directory) ?"
echo "3 - Album name only (for all the directory) ?"
echo "4 - Year only (for all the directory)?"
echo "5 - Track number only (for all the directory)?"
echo "6 - Album Total track number only (for all the directory)?"
echo "7 - Genre only (for all the directory)?"
echo ""
echo "8 - Exit ?"
echo "##########################################################"
echo ""
echo ""
}

default_songs_list

# read -p "Enter the number between 1 and 7 : " answer

# echo "you have chosen number " $answer

Choose_List

# echo "Everything went fine"
echo "Good Bye"