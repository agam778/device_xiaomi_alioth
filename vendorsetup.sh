echo "Applying libgui patch"
cd frameworks/native || exit 1
if git log -150 --oneline --decorate | grep "Add vendor version for libgui"; then
	echo "Fix was already applied"
else
	git fetch https://github.com/LineageOS/android_frameworks_native/ c73885dcba344f2640d7faf1e375c03e7c5ffacc && git cherry-pick FETCH_HEAD
fi
cd ../..

echo "Applying vibration fix"
cd frameworks/native || exit 1
if git log -150 --oneline --decorate | grep "Native: VibratorFeature: Import Xiaomi Android 13 Changes"; then
	echo "Fix was already applied"
else
	git fetch https://github.com/SuperiorOS/android_frameworks_native/ f499d9e3419053ceb93ad9da33f045dab6c146bc && git cherry-pick FETCH_HEAD
fi
cd ../..

echo "Applying patch for mmap issues on linux 6.1+"
cd art || exit 1
if git log -150 --oneline --decorate | grep "libartbase: mem_map: Retry up to 512 times on mmap() failure"; then
	echo "Fix was already applied"
else
	git fetch https://github.com/Linux4/android_art/ 67006f22e3f249587dc25e23013ba008e56438a9 && git cherry-pick FETCH_HEAD
fi
cd ..