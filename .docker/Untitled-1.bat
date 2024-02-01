wget https://github.com/miso-lims/miso-lims/archive/master.zip
unzip master.zip 'miso-lims-master/.docker/*'
mv miso-lims-master/.docker miso-lims-compose
rm -r master.zip miso-lims-master/
