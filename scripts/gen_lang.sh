if [ -d ".fvm" ] 
then
    fvm flutter pub global run intl_utils:generate
else
    flutter pub global run intl_utils:generate
fi
