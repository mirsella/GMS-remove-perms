packages="com.android.vending com.google.android.gms"
perms="ACCESS_BACKGROUND_LOCATION ACCESS_COARSE_LOCATION ACCESS_LOCATION_EXTRA_COMMANDS ACCESS_FINE_LOCATION READ_CONTACTS PACKAGE_USAGE_STATS READ_PHONE_STATE READ_PRIVILEGED_PHONE_STATE READ_PRIVILEGED_PHONE_STATE" 
for package in $packages; do
  eval $(dumpsys package "$package" | grep 'userId=')
  for perm in $perms; do 
    pm revoke --user "$userId" "$package" android.permission."$perm"
  done
done
