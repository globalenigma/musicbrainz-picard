Picard

This is a container for the picard music tagging application.

You can link the file you want to tag to /rips inside the container.

It's based on DesktopContainers/base-mate

Usage: Run the Client
Simple SSH X11 Forwarding
Since it is an X11 GUI software, usage is in two steps:

Run a background container as server or start existing one.

docker start picard || docker run -d --name picard -v /tmp/:/rips globalenigma/musicbrainz-picard

Connect to the server using ssh -X (as many times you want). Logging in with ssh automatically opens picard

ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no 
-X app@$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' picard)
