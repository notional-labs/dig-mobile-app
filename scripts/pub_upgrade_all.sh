if [ -d ".fvm" ] 
then
    cd dig_core
    fvm flutter pub upgrade
    cd ..
    fvm flutter pub upgrade
else
    cd dig_core
    flutter pub upgrade
    cd ..
    flutter pub upgrade
fi