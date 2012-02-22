mkdir -p data/grid

agentsCount=2

for (( i=1; i<=$agentsCount; i++ ))
do
    echo "Installing agent $i"
    mkdir -p data/grid/agent-$i/storage
    cp utils/configs/agent-$i.properties data/grid/agent-$i/grid.agent.properties
    cp utils/configs/agent-$i.tags.xml data/grid/agent-$i/grid.agent.tags.xml
    touch data/grid/agent-$i/start-agent.sh
    chmod +x data/grid/agent-$i/start-agent.sh 
    echo "java -classpath \"../../grid-library/oculus-grid.jar\" net.mindengine.oculus.grid.agent.Agent" > data/grid/agent-$i/start-agent.sh 
done
