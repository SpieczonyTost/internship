bash cronFoldersYear.bash
bash cronFoldersMonth.bash
bash cronFOM.bash
touch /cronTest/workingCron
bash cronWeekly.bash
touch /cronTest/workingCronFull
bash cronWeeklyFull.bash



# 0 20 1 1 * bash cronFoldersYear.bash
# 0 20 1 * * bash cronFoldersMonth.bash
# 0 20 1 * * bash cronFOM.bash
# 0 20 * * 1 bash cronWeekly.bash
# 0 20 * * 3 bash cronWeekly.bash
# 0 20 * * 5 bash cronWeekly.bash
# 0 20 * * 7 bash cronWeeklyFull.bash
# crontab -e