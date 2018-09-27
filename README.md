# Run All Dev Pledge Micro Services here

## Pull all the relevant repos into your own project directory system that you use for everyday development.

https://github.com/Dev-Pledge/Sentry

* Set Sentry up first so it can be used by other docker projects - just follow the READ ME...
* Once its setup bring the containers down and carry on with the install of the rest of the repos

https://github.com/Dev-Pledge/Nginx

https://github.com/Dev-Pledge/UI

https://github.com/Dev-Pledge/Feed

https://github.com/Dev-Pledge/API

* Just follow the READ ME for environment setups - use the examples given in the docker-compose.yml to create your .env- files...

https://github.com/Dev-Pledge/Cache




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
    
    ln -s ~/Projects/[yourlocalrepoofapi] ~/Projects/[fullprojectdir]/api
    
    ln -s ~/Projects/[yourlocalrepooffeed] ~/Projects/[fullprojectdir]/feed
    
    ln -s ~/Projects/[yourlocalrepoofui] ~/Projects/[fullprojectdir]/ui
    
    ln -s ~/Projects/[yourlocalrepoofcache] ~/Projects/[fullprojectdir]/cache
    
    ln -s ~/Projects/[yourlocalrepoofnginx] ~/Projects/[fullprojectdir]/nginx
    
Then setup create .sentryenv files in the api, auth, feed and ui     

    SENTRY_DSN=http://holdingkey:holding@@sentry:9000/1
    
Get things going with    
    
    make up

Then replace your holding SENTRY DSNs after you've generated your projects in sentry for api, auth, feed and ui - leave the sentry:9000 - change everything around it!
    
    make down-up
    
Now every time you bring it up it will all work and you can create amazing micro services for DP!

    make stop
    
    make start

If you commit and push any changes to the other repos always run:

    make git-up

This will bring your containers down pull all the repos from git hub rebuild everything and bring it all back up.
If it all comes back up and appears in your browser (automatically opens on macs) awesome.  If not, please fix asap!!!

## Trouble Shooting

If you run into any problems:
    
    make git-clean
    
This will clean docker, clean your composer installs and rebuild all images. Then bring it all up for you.
