
#############

# copy paste about:config > config

#############

rm prefs.js ; touch prefs.js

#############

grep -i -e '.*http://' -e '.*https://' -e '.*wss://' config | while read one two ; do

 printf "%s\n" "user_pref(\"${one}\", \"\");" >> prefs.js

done

#############

