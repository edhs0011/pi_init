url="https://www.facebook.com"
while true
do
    NUM=$(( ( RANDOM % 5 )  + 1 ))
    echo "sleep $NUM seconds then visit $url" >> /tmp/curl.log
    sleep $NUM
    curl $url > /dev/null 2>&1
done

