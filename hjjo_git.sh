#!/usr/bin/env bash

echo '''
  1. github summary
	
    - 리모트 저장소 복제
      $ git clone (리모트 저장소 URL)
	
	  - 리모트 저장소의 추가
      $ git add (리모트 저장소의 별명) (리모트 저장소의 URL)
	
	  - 리모트 저장소의 삭제
	    $ git remote rm (리모트 저장소의 별명)
	
   	- 리모트 브랜치와 동기화
      $ git fetch (리모트 저장소의 별명) (리모트 브랜치)
        (리모트 저장소 별명)에 해당하는 저장소의 (리모트 브랜치)를 현재 선택된 로컬 브랜치로 가져온다.
      $ git pull (리모트 저장소의 별명) (리모트 브랜치)
        git fetch 명령을 실행하고 자동으로 merge(병합) 하기
      $ git push (리모트 저장소의 별명) (리모트 브랜치)
        (리모트 저장소 별명)의 (리모트 브랜치)로 로컬 브랜치를 전송한다.
         이 명령을 수행하기 전에 git fetch나 git pull을 수행한다.
			 
    - 리모트 브랜치 생성   
      $ git checkout -b (새로운 브랜치)
        (새로운 브랜치)를 로컬 브랜치로 만든다.
      $ git push (리모트 저장소) (리모트 브랜치)
        (리모트 저장소)에 (리모트 브랜치)를 생성하고 현재의 로컬 브랜치와 추적상태를 만든다.

	  - 리모트 브랜치 현황보기	  
      $ git remote
        로컬 브랜치에 연결되어 있는 리모트 브랜치 리스트 보기
      $ git remote show (리모트 브랜치)
        (리모트 브랜치)와 로컬브랜치의 관계를 상세히 보기

	  - 리모트 브랜치 삭제
	    $ git push (리모트 저장소의 별명) :(리모트 브랜치)
        (리모트 저장소의 별명)의 (리모트 브랜치를 삭제) ':' 앞에 뛰어쓰기해야 함
				
	6. homepage
	  - http://blog.hjf.pe.kr/57 -> usage myserver, github.
    - http://dimdim.tistory.com/entry/GIT%EC%97%90-%EB%8C%80%ED%95%9C-%EB%82%B4%EC%9A%A9%EC%A0%95%EB%A6%AC-%EC%A0%95%EB%A6%AC%EC%A4%91 -> 명령어요약
    - https://opentutorials.org/course/303/2314 -> 생활코딩
    - http://egloos.zum.com/repository/v/5730787
    - http://git-scm.com/book/en/v2 -> pro git ebook
'''



######################################################################
## define
######################################################################
_sMyFile=${0}
_sCommand=${1}
_sRepositoryUrl=${2}

####################################################################
# define
####################################################################
_PREFIX_MESSAGE=[${_sMyFile}]

####################################################################
# export
####################################################################
#export OPENCV_ROOT=${_OPENALPR_ROOT}/maketrain/opencv_2.4.9/x64


####################################################################
# push_repository
####################################################################
push_repository()
{
	git remote add origin ${_sRepositoryUrl}
	git push -u origin master 
}

####################################################################
# create_repository
####################################################################
create_repository()
{
	touch README.md
	git init
	git add README.md
	git commit -m "first commit"
	
	push_repository
}


####################################################################
# BUILD
####################################################################
main()
{
  cd ./${_sProjectName}
	
	if [ ${_sCmdName} = "-h" ]; then
    "${_PREFIX_MESSAGE} ./${_sMyFile}.sh _sLangName _sMyDataPath"
	elif [ ${_sCmdName} = "create" ]; then
    create_project
	else 
    echo "${_PREFIX_MESSAGE} not support command [${_sCommand}]"
	fi

	exit 1
}

main