apt install v4l2loopback-dkms 
echo "options v4l2loopback devices=3 exclusive_caps=1,1,1" > /etc/modprobe.d/v4l2loopback.conf
echo "v4l2loopback" >> /etc/modules

ffmpeg -re -f lavfi -i testsrc=s=1280x720 -f v4l2 /dev/video1
ffmpeg -re -f lavfi -i testsrc=s=1280x720 -f v4l2 /dev/video2
ffmpeg -re -f lavfi -i testsrc=s=1280x720 -f v4l2 /dev/video3

### To change options ###
# modprobe -r v4l2loopback
# vim /etc/modprobe.d/v4l2loopback.conf
# modprobe v4l2loopback
