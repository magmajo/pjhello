echo "
2.8. webdev
    - install nodejs, jdk, android 
      . install nodejs ( http://nodejs.org/ )
      . install jdk ( http://www.oracle.com/technetwork/java/javase/downloads/index.html )
        set JAVA_HOME='d:\work\devtool\android\android_studio\1.0\sdk\'
        set JDK_HOME='d:\work\devtool\android\android_studio\1.0\sdk\'
      . install android ( http://developer.android.com/sdk/index.html )
        set ANDROID_HOME='d:\work\devtool\android\android_studio\1.0\sdk\'

    - install node package
      . express : http://expressjs.com/ 
			            http://cwbuecheler.com/web/tutorials/2013/node-express-mongo/
        $ npm install -g express express-generator
        $ express ndhello
				$ cd ndhello
        $ npm install
				$ npm start
				$ mongod --dbpath c:\node\nodetest1\data
  
      . phonegap : http://phonegap.com/install/
			             https://www.npmjs.com/package/phonegap
			             http://blog.saltfactory.net/228
			             http://docs.phonegap.com/en/3.0.0/guide_cli_index.md.html#The%20Command-line%20Interface
        $ npm install -g phonegap
				$ phonegap create {프로젝트이름} -i {패키지이름(app identifier)} -n {프로젝트 디스플레이 이름}
				$ phonegap create pghello -i nmagma.phonegap.hello -n pghello 
        $ cd pghello
				$ phonegap build android				
        $ phonegap run android				
 
      . cordova : http://cordova.apache.org
                  http://cordova.apache.org/docs/en/4.0.0//guide_cli_index.md.html#The%20Command-Line%20Interface
				. Install Cordova
          $ npm install -g cordova ionic plugman ios-sim
				. Create the App
				  $ cordova create {프로젝트 디렉토리 이름} {프로젝트 identifier} {프로젝트 이름}
          $ cordova create cbhello nmagma.cordova.hello cbhello
				. Add Platforms
          $ cordova platform add android
          $ cordova platforms ls
					$ cordova platform rm android
				. Build the App
				  $ cordova build 
				  $ cordova build android 
				. Test the App on an Emulator or Device
				  $ cordova emulate android
				. phonegap remote build : https://build.phonegap.com
				  $ zip -r pghello.zip pghello/
					$ phonegap remote login ( email : jhj0607@hotmail.com, pwd : tkrkfWH#xxxx )
					$ phonegap remote build android
				  $ ANDROID_HOME/platform-tools/adb install pghello.apk
					$ iOS register : https://developer.apple.com/account/overview.action
					                 https://developer.apple.com/devcenter/ios/index.action
"
	
exit 1
	
_sCommand=$1
_sPlatform=$2
_sProjectName=$3

if [ ${_sCommand} = 'create' ]; then 
	if [ -d "./${_sProjectName}" ]; then
		echo "Exit project '${_sProjectName}'"
		exit 1
	fi 
	cordova create pghello nmagma.phonegap.hello "Hello"
	cd ${_sProjectName}
	cordova platform add android   # or phonegap run android
  cordova plugin add org.apache.cordova.device
	cordova plugin add org.apache.cordova.network-information
  cordova plugin add org.apache.cordova.battery-status
	cordova plugin add org.apache.cordova.device-motion
	cordova plugin add org.apache.cordova.device-orientation
	cordova plugin add org.apache.cordova.geolocation
	cordova plugin add org.apache.cordova.camera
	cordova plugin add org.apache.cordova.media-capture
	cordova plugin add org.apache.cordova.media
	cordova plugin add org.apache.cordova.file
	cordova plugin add org.apache.cordova.file-transfer
	cordova plugin add org.apache.cordova.contacts
	cordova plugin add org.apache.cordova.globalization
	cordova plugin add org.apache.cordova.splashscreen
	cordova plugin add org.apache.cordova.inappbrowser
	cordova plugin add org.apache.cordova.console
	
elif [ ${_sCommand} = 'build' ]; then 
  cd ${_sProjectName}
  cordova build ${_sPlatform}
elif [ ${_sCommand} = 'emulate' ]; then 
  cd ${_sProjectName}
  cordova emulate ${_sPlatform}
elif [ ${_sCommand} = 'run' ]; then 
  cd ${_sProjectName}
	cordova run ${_sPlatform}
else 
  echo "not support command"
fi

exit