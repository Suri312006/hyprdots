pids=$(ps ax | grep /usr/share/discord/resources/app.asar | sed -n 's/.* \([0-9]\{5\}\) .*/\1/p')
read -a array <<< "$pids" 
echo "$array"
kill $array
# for i in array
#
#     do 
#         echo "$i penis"
#     done
#echo "$pids"
