
#############
printf "%s\n\n" "Content-type: text/html"
#############
printf "%s\n" "<html>"
#############
printf "%s\n" "<head><link rel="stylesheet" href="/css"></head>"
#############
printf "%s\n" "<body><div class='outer'><div class='middle'><div class='inner'>"
#############
cd /tmp/storage/services/gitd/repo/project
printf "%s\n" "<pre>$(ls -lah)</pre> </br>"
printf "%s\n" "<pre>$(git ls-tree HEAD)</pre> </br>"
#############
printf "%s\n" "</div></div></div></body>"
#############
printf "%s\n" "</html>"
#############

