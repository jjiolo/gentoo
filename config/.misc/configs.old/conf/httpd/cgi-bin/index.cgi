
#############
printf "%s\n\n" "Content-type: text/html"
#############
cat << EOF
<pre>
$(env)
</pre>
EOF
#############

