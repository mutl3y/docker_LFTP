# lftp Readme
# This Docker will build lftp from source

Optional build Variables: 
-------------------------------
version         

This should be the full filename, E.G. docker build --build-arg version=lftp-4.7.1.tar.gz

To build latest version
docker build -t mutl3y:lftp_latest

To build a specific version supply the entire filename, E.G: To build version 4.7.1 you would run
docker build --build-arg version=lftp-4.7.1.tar.gz -t mutl3y:llftp_4.7.1
