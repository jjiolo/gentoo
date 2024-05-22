
#############
printf "%s\n\n" "Content-type: text/html"
#############
printf "%s\n" "<html>"
#############
printf "%s\n" "<head><link rel='stylesheet' href='/css'></head>"
#############
printf "%s\n" "<body>"
#############
printf "%s\n" "<div class='outer'><div class='middle'><div class='inner'>"
#############
cd /tmp/storage/services/httpd/repo/project
printf "%s\n" "<fieldset><legend>directory</legend><pre>$(git ls-tree HEAD)</pre></fieldset></br>"
printf "%s\n" "<fieldset><legend>commit history</legend><pre>$(git log -7 --format='%h %f %an %ar')</pre></fieldset></br>"
printf "%s\n" "<fieldset><legend>last commit</legend><pre>$(git log -7 --format='%h %f %an %ar' -c)</pre></fieldset></br>"
#############
printf "%s\n" "</div></div></div>"
#############
printf "%s\n" "</body>"
#############
printf "%s\n" "</html>"
#############

