# Fetures
> Interperted mode! Call functions in any order

> Automated git add. Add all new files includeing updated files

> Automated git remove. Will update local respository to removed files

> #Ignore tag. Place inside any file and the script will ignore it

> Autogenerate text file. Place text file in all git tracked filders. Great for seting up an initial commit. Works with appending too.

> Can search for a tag and store the results in a log

> Really complex startup stuff :D You'll see

> In program help menu

> Working directory log. Creats a file that lists the git project folders. (Does not include hidden git folders)

> Update git! Set you're own message or use the default (Includes both commit and or push)

> Displays status throughout script.

> Puts any uncommited changes into a log

> Creats a log of all files with the #todo tag

> Checkes haskell files for errors and stores results in a log

# -----------HELP----------
The below flags can be included in any order as the first argument (Unless noted)

help -> Display in script help file

u -> Update tracking

i -> Interpreted

q -> Supress start text

c -> Commit text

m -> Add message for commit. Message must be second argument

d -> Insert text file in all directory

p -> Push commit

a -> Append new file

If #Ignore tag is found the file will be skipped

# ---------Interpreted Help--------
helpPage 		-> Display current page

startUp  		-> Run Startup text

mainStuff 		-> Run main code for assignment

createDefault 	-> Create a default text file in each folder | Takes argument for append

addFiles 		-> Add files to git tracking

removeFiles 	-> Remove files from git tracking

getStatus 		-> Get git status

gitPush 		-> Push code to local git

gitCommit 		-> Commit changes | Takes argument for optional message

# References
https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

https://stackoverflow.com/questions/12668020/removing-characters-from-grep-output

https://unix.stackexchange.com/questions/15197/is-there-a-correct-way-to-list-the-subdirectories-of-the-current-directory?rq=1

https://stackoverflow.com/questions/26850806/sed-replace-exact-match

https://stackoverflow.com/questions/229551/string-contains-in-bash

https://stackoverflow.com/questions/27658675/how-to-remove-last-n-characters-from-a-string-in-bash

https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash

https://stackoverflow.com/questions/19951369/how-to-store-grep-command-result-in-some-variable-in-shell

https://www.cyberciti.biz/faq/bash-infinite-loop/

http://tldp.org/LDP/abs/html/functions.html
