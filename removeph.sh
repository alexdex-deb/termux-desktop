# Disable Phantom Process Killer
echo "setting new permissions"
sleep 2
su -c /system/bin/device_config set_sync_disabled_for_tests persistent
su -c /system/bin/device_config put activity_manager max_phantom_processes 2147483647
su -c setprop persist.sys.fflag.override.settings_enable_monitor_phantom_procs false

# Checking New Permissions
echo "checking new config"
sleep 2
su -c /system/bin/dumpsys activity settings | grep max_phantom_processes
su -c getprop persist.sys.fflag.override.settings_enable_monitor_phantom_procs
	
