directories:
     mkdir team1
     cp module1.cpp module1_new.cpp
     mv module1_new.cpp ./team1/module.cpp
     mkdir team2
     cp module2.cpp module2_new.cpp
     mv module2_new.cpp ./team2/module.cpp
     mkdir team3
     cp module3.cpp module3_new.cpp
     mv module3_new.cpp ./team3/module.cpp
system.cpp: team1 team2 team3
     cat ./team1/module.cpp > system.cpp
     cat ./team2/module.cpp >> system.cpp
     cat ./team3/module.cpp >> system.cpp
     g++ -o semicol semicol.cpp
     g++ -o single single.cpp
     ./semicol system.cpp > tmpCode
     ./single tmpCode > system.cpp
     
clean:
     rm -rf team1 team2 team3
     rm tmpCode single semicol system.cpp