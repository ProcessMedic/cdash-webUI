# short bash script to store and download site copies.
SITE="examplesite.com"
copying="Copying site directories..."
copying_done="Site copy done."
SITE_DOWNLOAD_LOCATION="/usr/share/site-copies/$SITE"
function downloadCopy {    # function for downloading the copy we made.
  echo "Downloading site copy of $SITE..."
  wget $SITE_DOWNLOAD_LOCATION
  echo "Copy of $SITE downloaded."
}
function sleepRead {
  sleep 1
}
# script entrypoint
echo "$copying"
sudo mkdir -p /usr/share/site-copies
sudo mkdir -p /usr/share/site-copies/$SITE
sudo cp /var/www/html/$SITE /usr/share/site-copies/$SITE
echo "Would you like to download a copy now? Please type yes or no: "
read download_answer
if [ download_answer == "Yes" ]; 
then
  downloadCopy
else
  echo "All done! Exiting."
  exit
fi
echo "$copying_done"
exit
