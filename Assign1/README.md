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

> Checkes haskell files for erros and stores results in a log

# -----------HELP----------
The below flags can be included in any order as the first argument (Unless noted)

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
