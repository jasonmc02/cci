# bundle exec rake test

#!/bin/bash
# echo 'Cleanup coverage folder'
# rm -rf coverage

# echo 'Restart MongoDB to prevent failures'
# bash restart_mongo.sh

bundle exec rake db:create
bundle exec rake db:migrate

echo 'Start Server'
# SIMPLECOV=ON thin start > thin.log 2>&1 &
bundle exec rails server -d > $CIRCLE_ARTIFACTS/debug.log 2>&1 &
server_process_id=$!

sleep 10

# until grep -q 3000 $CIRCLE_ARTIFACTS/debug.log; do
    echo -ne "\033[0K\r Starting Server process id $server_process_id"
# done

wget http://dev.mycompany.com:3000

# echo 'Start Resque'
# RAILS_ENV=selenium rake resque:work QUEUE=* VERBOSE=1 > resque.log 2>&1 &
# resque_process_id=$!
# until grep -q Running resque.log; do
#     echo -ne "\033[0K\r Starting Resque process id $resque_process_id"
# #    echo -ne "$pc%\033[0K\r"
# done

# echo 'run selenium test'
# mvn -q clean test -DsuiteXmlFile=container_suite.xml -q -f ~/Documents/gradesfirst_qa

# echo 'Stop Server'
# kill $server_process_id

# echo 'Stop Resque'
# kill $resque_process_id

# bundle exec rake test:routes --trace
# bundle exec rake test --trace
# bundle exec cucumber -p default_report --format json --out temp/cucumber/tests.cucumber
# bundle exec rake test:octopus

# These are ways to kill resque and thin in case they got stuck or something
# kill -9 lsof -i tcp:3000
# kill `ps aux | grep [r]esque | grep -v grep | cut -c 10-14`
# kill `ps aux | grep [t]hin | grep -v grep  | cut -c 10-14`

