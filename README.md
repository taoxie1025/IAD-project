
     ,-----.,--.                  ,--. ,---.   ,--.,------.  ,------.
    '  .--./|  | ,---. ,--.,--. ,-|  || o   \  |  ||  .-.  \ |  .---'
    |  |    |  || .-. ||  ||  |' .-. |`..'  |  |  ||  |  \  :|  `--, 
    '  '--'\|  |' '-' ''  ''  '\ `-' | .'  /   |  ||  '--'  /|  `---.
     `-----'`--' `---'  `----'  `---'  `--'    `--'`-------' `------'
    ----------------------------------------------------------------- 


Special Instructions for IAD-Project Group Members:

1. Each time you clone this repository, you have to do:
    - bundle install
    - rake db:migrate
2. You then need to go to routes.rb, change the following to your host address:
    - default_url_options :host => "YOUR_HOST_ADDRESS"
3. If someone edits the schema or migration files, you need to start a new workplace and clone the repository, or do the followings after you pulled them:
    - rake db:reset
    - rake db:migrate