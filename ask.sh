DB_NAME=dbsql1
DB_USER=dbsql1
DB_PASSWORD=passpass
DATE=$(date +"%F")


echo -e "I'm ask.sh. What you like to do?, enter a Task Id from list below: \n"
echo -e "TaskID\t Description"
echo -e "1\t Run - Docker Test Enviroment "
echo -e "2\t Clean Docker - Clean the docker containers and volumes "
echo -e "3\t Clean All - Clean the docker containers and volumes and images "



read task

if [ "$task" = "1" ]; then
    echo "... ${task}"
    cd dockers
    docker-compose up -d
    echo "Go to"
    echo "http://127.0.0.1"
    
elif [ "$task" = "2" ]; then
    echo "... ${task}"    
    docker rm --force `docker ps -qa`
    docker volume rm $(docker volume ls -q --filter dangling=true)
    docker network prune
    
elif [ "$task" = "3" ]; then
    echo "... ${task}"
    docker rm --force `docker ps -qa`
    docker volume rm $(docker volume ls -q --filter dangling=true)
    docker network prune
    docker rmi --force `docker images -aq`    

else
    echo "Goodbye! - Exit"

fi


