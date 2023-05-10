echo "Applying libgui patch"
cd frameworks/native || exit 1
if git log -150 --oneline --decorate | grep "Add vendor version for libgui"; then
	echo "Fix was already applied"
else
	git fetch https://github.com/LineageOS/android_frameworks_native/ c73885dcba344f2640d7faf1e375c03e7c5ffacc && git cherry-pick FETCH_HEAD
fi
cd ../..