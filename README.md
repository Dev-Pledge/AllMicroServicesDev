
Run All Dev Pledge Micro Services here

Clone all the relevant repos.

https://github.com/Dev-Pledge/Sentry

* Set Sentry Up First So it can be used by other docker projects - just follow the readme

https://github.com/Dev-Pledge/Nginx

https://github.com/Dev-Pledge/UI

https://github.com/Dev-Pledge/Feed

https://github.com/Dev-Pledge/API

https://github.com/Dev-Pledge/Auth




    sudo nano /etc/hosts
    
Copy these entries into the hosts file     
    
    #sentry
    127.0.0.1       dev.errors.projects.com
    #devpledge
    127.0.0.1       dev.errors.devpledge.com
    127.0.0.1       dev.auth.devpledge.com
    127.0.0.1       dev.api.devpledge.com
    127.0.0.1       dev.feed.devpledge.com
    127.0.0.1       dev.devpledge.com

Symlink all the repos into the project

    ln -s ~/Projects/[yourlocalrepoofsentry] ~/Projects/[fullprojectdir]/sentry
    
    ln -s ~/Projects/[yourlocalrepoofauth] ~/Projects/[fullprojectdir]/auth
    
    ln -s ~/Projects/[yourlocalrepoofapi] ~/Projects/[fullprojectdir]/api
    
    ln -s ~/Projects/[yourlocalrepooffeed] ~/Projects/[fullprojectdir]/feed
    
    ln -s ~/Projects/[yourlocalrepoofui] ~/Projects/[fullprojectdir]/ui
    
    ln -s ~/Projects/[yourlocalrepoofnginx] ~/Projects/[fullprojectdir]/nginx
    
Get things going with    
    
    make up
