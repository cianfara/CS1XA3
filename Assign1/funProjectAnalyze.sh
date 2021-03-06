#!/bin/bash

Green="\033[0;32m"
White="\033[1;37m"
Space="\t\t\t\t\t\t\t"
Format=${Space}${Green}
Home=$(pwd)
DefaultGitMsg="Default commit message"

function helpPage
{
	cat testScrMan
	exit 0
}

function startUp
{
echo "Root directory is set to: ${Home}"
cat startupData |
while read stuffToDo
do
    echo -e "${stuffToDo}${Format}[OK]${White}"
	sleep 0.5
done
}

function mainStuff
{
git status
echo "Adding changes to log"
echo -e "\n\n${Green}New and Modified${White}" > changes.log
git status -s | grep "?? \| M " | sed 's/.\{3\}//' >> changes.log
echo -e "\n\n${Green}Removed files:${White}" >> changes.log
git status -s | grep " D " | sed 's/.\{3\}//' >> changes.log
echo -e "\n\n${Green}Changed code:${White}" >> changes.log
git diff >> changes.log
grep --exclude="todo.log" -r "#TODO" . > todo.log

> error.log
find . -name "*.hs" |
while read checkHs
do
        ghc -fno-code $(basename "$checkHs") 2>> error.log              #Copies just the error. Use &>> for both the error and regular output
done
}


function createDefault ()
{
	echo "Please enter a file name"
	read fileName
	echo "Enter default text"
	read defaultText
	cat workingTree.log |
	while read targetDir #ToDo check if file already exists. Have flag for overwrite
	do
	
		echo "Creating file ${fileName} in ${targetDir}"
		cd $targetDir
		touch ${fileName}
		if [[ $1 == *"a"* ]]
		then
			echo ${defaultText} >> ${fileName}
		else
			echo ${defaultText} > ${fileName}
		fi
		cd ${Home}
	done
}

function addFiles
{
echo "Staring Add Files"
git status -s | grep "?? \| M " | sed 's/.\{3\}//' |  					        #Sed is magic. Please don't touch
while read stuffToAdd
do
	find -name $(basename ${stuffToAdd}) -printf '%h\n' |  					#This finds the files and leaves just the path
	while read inDir
	do
		cd ${inDir}
		if [ -e $(basename "$stuffToAdd") ]
		then
			CheckTag=$(grep "#ignore" $(basename "$stuffToAdd")) 			#Going two sub-shells deep
			if [ "$CheckTag" != "#ignore" ]
			then
        			echo "Adding $(basename "$stuffToAdd") in ${inDir}"
               			git add $(basename "$stuffToAdd")
			else
        			echo "Found #ignore tag: $(basename "$stuffToAdd") ignored"
			fi
		fi
		cd $Home
	done
	cd $Home
done
}

function removeFiles
{
echo "Starting remove files"
git status -s | grep " D " | sed 's/.\{3\}//' |
while read stuffToRm
do
        git rm -f ${stuffToRm}
done
}

function getStatus
{
echo -e "\n\n\nUpdated git status"
echo "---------------------------------"
git status
}

function gitCommit ()
{
	if [[ $1 == *"m"* ]]
	then
			echo "Sending commit with message ${2}"
			git commit -m "${2}"
else
	echo "Sending commit with default message"
		git commit -m "Default auto commit"
	fi
}

function gitPush
{
	git push
}

echo "Entering Interpreted Mode"
echo "Type \"helpPage\" for help"
for (( ; ; ))
do
	echo "Enter a command:"
	read toExe
	$toExe
done
