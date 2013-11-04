# Holds my current todo-list
add non-0 user
add non0 to visudo passwordless
install vim / tmux / htop / s3fs
clone dotfiles for 0 and non0

update package index
upgrade packages

## Latest

So I just got a video torrented down on an ec2 instance, encoded it with libvpx (WebM) and
streamed it live over HTTP, ala youtube. My next project will be a dynamic webapp to torrent things
and stream them to you at your convenience.

Here's a CLI way to grant access to your S3 buckets -- s3cmd setacl --acl-public --recursive $BUCKET

## vim

TIL :: use sessions like a boss
To automatically save and restore views for *.c files: >
  au BufWinLeave *.c mkview
  au BufWinEnter *.c silent loadview

