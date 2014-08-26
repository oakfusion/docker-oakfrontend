docker-oakfrontend
==================

Building image:  
`sudo docker build -t oakfrontend .`

Running image:  
`sudo docker run --net host -v <path_to_frontend_app_directory_on_your_host>:/home/app -i -t oakfrontend`

