# npm install -g bower
# http://hatemogi.com/holiday-project-day-04/
# http://bower.io/docs/creating-packages/


echo '{"directory": "public/bower_components"}' > .bowerrc
bower init
bower install jquery --save
bower install jquery-ui --save 

bower install bootstrap --save
bower install angular#1.3.0-beta.8 --save
bower install google-code-prettify highlights --save 
bower install karma jasmine --save-dev