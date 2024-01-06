
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
printf "%s\n" "<fieldset><pre>$(ls -lah)         </pre></fieldset></br>"
printf "%s\n" "<fieldset><pre>$(git ls-tree HEAD)</pre></fieldset></br>"
#############
printf "%s\n" "</div></div></div>"
#############
printf "%s\n" "</body>"
#############
printf "%s\n" "</html>"
#############

