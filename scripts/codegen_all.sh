if [ -d ".fvm" ] 
then
    cd dig_core
    fvm flutter packages pub run build_runner clean
    fvm flutter packages pub run build_runner build --delete-conflicting-outputs
    cd ..
    fvm flutter packages pub run build_runner clean
    fvm flutter packages pub run build_runner build --delete-conflicting-outputs
else
    cd dig_core
    flutter packages pub run build_runner clean
    flutter packages pub run build_runner build --delete-conflicting-outputs
    cd ..
    flutter packages pub run build_runner clean
    flutter packages pub run build_runner build --delete-conflicting-outputs
fi


