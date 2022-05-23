# Dockerising PHP XML Import Applictaion

## Initialization

## Tested for Linux

### Building Application

chmod +x ./build.sh

chmod +x ./run.sh

./build.sh

# Run Application


<code> curl -s http://a.cdn.searchspring.net/help/feeds/searchspring.xml | /run.sh export csv </code>


<code> curl -s http://a.cdn.searchspring.net/help/feeds/searchspring.xml | ./run.sh export json </code>


<code> cat path/filename.xml | ./run.sh export csv </code>
 
 
 <code> cat path/filename.xml | ./run.sh export json </code>

