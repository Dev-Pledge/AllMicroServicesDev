#Run All Dev Pledge Micro Services here

Clone all the relevant repos


    sudo nano /etc/hosts
    
    #sentry
    127.0.0.1       dev.errors.projects.com
    #devpledge
    127.0.0.1       dev.errors.devpledge.com
    127.0.0.1       dev.auth.devpledge.com
    127.0.0.1       dev.api.devpledge.com
    127.0.0.1       dev.feed.devpledge.com
    127.0.0.1       dev.devpledge.com

    ln -s ~/Projects/[yourlocalrepoofsentry] ~/Projects/[fullprojectdir]/sentry
    
    ln -s ~/Projects/[yourlocalrepoofauth] ~/Projects/[fullprojectdir]/auth
    
    ln -s ~/Projects/[yourlocalrepoofapi] ~/Projects/[fullprojectdir]/api
    
    ln -s ~/Projects/[yourlocalrepooffeed] ~/Projects/[fullprojectdir]/feed
    
    ln -s ~/Projects/[yourlocalrepoofui] ~/Projects/[fullprojectdir]/ui
    
    ln -s ~/Projects/[yourlocalrepoofnginx] ~/Projects/[fullprojectdir]/nginx
    
    make up