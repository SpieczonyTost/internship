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

# touch 1_Sunday_Full.tar 8_Sunday_Full.tar 15_Sunday_Full.tar 24_Sunday_Full.tar 31_Sunday_Full.tar
# touch 2_Monday.tar 4_Wednesday.tar 6_Friday.tar 9_Monday.tar 11_Wednesday.tar 13_Friday.tar 16_Monday.tar 18_Wednesday.tar 20_Friday.tar 25_Monday.tar 27_Wednesday.tar 29_Friday.tar

# ls *.tar | grep 15 | cut -d "_" -f 3              if Full.tar then just use this tar

# ls *Sunday*
# ls *Monday.tar*
# ls *Wednesday.tar*
# ls *Friday.tar*


# create restore folder