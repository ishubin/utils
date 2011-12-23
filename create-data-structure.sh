echo 'Creating data directory'    
mkdir -p data 
mkdir -p data/storage-server
mkdir -p data/storage-agent-1

echo 'Creating basic sample project'
cd data/storage-server
mkdir -p sample-project/current
cd sample-project/current
touch sample-project-current.zip
touch .gridproject
echo "" > .gridproject
echo "project.name = sample-project" >> .gridproject
echo "project.version = current" >> .gridproject
echo "control.key = iamacontrolkey" >> .gridproject
echo "upload.date = 01.01.2011 12:34:56" >> .gridproject
echo "upload.user = johny" >> .gridproject


cd ../../../../

