echo "Path to home directory is: $HOME"
term=$TERM
echo "Terminal Type: $term"
echo "The Run level 3 processes are: "
echo `ls /etc/rc3.d/S*`

#changing the permission with
# chmod +x script.sh

#changing the permission for admin only
# sudo chown root:root script.sh
# sudo chmod 600 script.sh 
