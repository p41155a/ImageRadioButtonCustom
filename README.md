###목차  
[1.예제로 scrollView autolayout을 잡는법 / snapkit ](#예제-start!)  
[2.autoLayout의 기본 공식](#왜-음수가-들어가는-걸까요?)


오늘은 저도 많이 사용하고 있는 SnapKit이라는 라이브러리에 대해 소개하고

아주 자그마한 프로젝트로 설명해 드리려고 합니다.  

 <br/>

stroyboard로 autolayout을 한다면 이런 식으로 설정할 수 있겠죠?



![img](https://blog.kakaocdn.net/dn/bpLbTG/btqGfabLnFo/2kcg0xTijeRJ9TXwlBH1E0/img.png)



 

가끔 모든 프로젝트를 코드로만 만들기도 하지만

 <br/> 

저는 어느정도 storyBoard에 형태가 나와 있는 것을 선호하기 때문에

위치정도는 storyBoard에 잡고 customButton을 만들어 줄게요

(xCode 11에서 바뀐 scroll View 오토레이아웃도 설명 드릴겸)

<br/>

## 예제 start!

우선 형태 먼저 만들어 줄까요?

 

이제 스크롤 뷰를 만들면 기존과 달리 content Layout Guide, Frame Layout Guide가 추가 되어 나오는데요

 

아래와 같이 스크롤 뷰는 safeArea에 딱 맞춰 주시고

안에 뷰를 추가하여 각 면는 content Layout Guide에 맞추고

넓이를 Frame에 맞춰 주세요

 

<img src="https://blog.kakaocdn.net/dn/KCNxq/btqGkWX4qK6/VGzMdMdMnitCsCSXkPylf0/img.png" width="500">





아직도 빨간 색이 뜨는게 여간 보기 싫은게 아니죠?

 

빠르게 안에 내용을 넣어 봅시다

 



<img src="https://blog.kakaocdn.net/dn/FXVE8/btqGmpl6fz2/wGmzxu0Kwb481FwIrMKJB0/img.png" width=500>



자 이제 빨간색도 없어졌고 더이상 스토리보드는 건드리지 않겠습니다.

 

customButton을 만들 시간입니다.



![img](https://blog.kakaocdn.net/dn/bSkvXp/btqGiUfnHWL/iPWaE21D01huNcyueAgF80/img.png)



모든 버튼 타입은 custom으로 바꾸는 것을 잊지 마시고

 

이제 코딩을 하기 전에 snapkit 라이브러리 세팅을 하겠습니다.

 

안전하게 세팅하기 위해 프로젝트를 닫아 주세요

 

https://blog.naver.com/p41155a/221661636123

여기에 cocoaPods로 라이브러리 관리 하는 법 자세히 설명해 두었으니 참고하세요

 



![img](https://blog.kakaocdn.net/dn/Iy1fX/btqGkVSpU19/NLVYjYw5I9NuaREtkwsENK/img.gif)



저렇게 설정에서 option키 누르면 경로명 복사 되니 복사해 주시고

 

터미널에

```
$ cd (위치)
$ pod init
$ vi podfile
```

pod 'SnapKit', '~> 5.0.0' 추가

 

나와서

pod install

 



![img](https://blog.kakaocdn.net/dn/d47pRM/btqGpxi038m/pk3lbKg87mwkGlsv3XpAzK/img.png)



반드시 이 파일로 들어가기

 

제가 개발 처음할 때 생각하며 설명하다

하다보니 너무 쓸모없는 내용들이 많이 들어갔네요

 

이제 진짜 snapkit을 사용해 봅시다

 

저는 이런 식으로 개발했는데요

 



![img](https://blog.kakaocdn.net/dn/nlXZn/btqGn0lFcaS/6z2kViO0B7jix3rrQUQVDK/img.png)



 

```
buttonImageView.snp.makeConstraints { maker in
  maker.top.equalToSuperview()
  maker.leading.equalToSuperview()
  maker.trailing.equalToSuperview()
  maker.height.equalTo(self.snp.width)
}
```

이 부분이 snapkit 코드랍니다.

 

equalToSuperview()는 이것의 슈퍼 뷰인 button이 되고

 

maker.leading.equalTo(radioButton.snp.trailing).offset(4)

이것 처럼 radioButton.snp.trailing을 기준으로 4만큼 떨어뜨릴 수도 있습니다.

 

autolayout과 다른 점은 

**maker.bottom.equalToSuperview().offset(****-6****)**

과 같이 -로 표현해야하는 것도 있다는 것입니다.

## 
<br/>

> **💡왜 음수가 들어가는 걸까요?****



![img](https://blog.kakaocdn.net/dn/R68OQ/btq3XbEjSB4/LZIRxGIrB7sz1yzg1zKnfK/img.png)

![img](https://blog.kakaocdn.net/dn/4lcZ9/btq32ApYbIW/7Q8jIL1ElAPE8adU78fVR0/img.png)



위와 같이 auto layout을 잡으면 trailing과 bottom은 View가 뒤에, leading과 top은 View가 앞에 보이는 것을 알 수 있습니다.



![img](https://blog.kakaocdn.net/dn/bdYFWQ/btq31arliVM/EdropAiZGn5cwOZPd76xM1/img.png)



이유는 first Item의 기준 입니다.

> **FirstItem.attribute = Mutiplier \* SecondItem.attribute + Constant**

이렇기 때문에 위치가 바뀌는 것입니다.

스토리보드에서는 대부분 알아서 firstItem을 잡아 양수로 만들어 주는 편이지만

snapkit을 사용하면



<img src="https://blog.kakaocdn.net/dn/lsOeT/btq3YUCwKtr/vX2HjI6MZC2OOAR1XnuIdk/img.png" width=500>



buttonTitle이 firstItem으로서 기준을 맞추기 때문에 음수가 자주 쓰이게 되는 것입니다.

<br/><br/>



✨완성된 화면



![custom-ex](https://user-images.githubusercontent.com/50395024/90994411-8a665f80-e5f3-11ea-8bcf-c495332bc337.gif)
