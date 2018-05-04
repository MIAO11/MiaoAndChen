import { Injectable } from '@angular/core';
import { HttpService } from '../http/http.service';
/**
 * 首页服务
 */
@Injectable()
// tslint:disable-next-line:class-name
export class homeService {
  constructor(private httpService: HttpService, ) {
  }

  // 获取近日推荐首页信息
  patientIndexInfo(pamars) {
    return this.httpService.get('comic/todayRecommend', pamars);
  }

  // 获取近日推荐首页信息详情  htmlId
  todayDetail(pamars) {
    return this.httpService.get('comic/todayItem', pamars);
  }


  //获取首页数据
  public getHomeDtaaLists() {
    return this.httpService.get('http://app.u17.com/v3/app/android/phone/recommend/itemlist?version=1099&key=null', null);
  }

  //获取漫画目录
  public getmulu(comic_id: number) {
    return this.httpService.get('http://app.u17.com/v3/app/android/phone/comic/detail_static?comicid=' + comic_id + '&key=null', null);
  }

  //获取漫画内容
  public getlookmulu(chapter_id: number) {
    // tslint:disable-next-line:max-line-length
    return this.httpService.get('http://app.u17.com/v3/app/android/phone/comic/chapter?chapter_id=' + chapter_id + '&t=1456319572&v=2280099&android_id=d537c4070191aace&key=null&come_from=PPzhushou&model=m1+note', null);
  }
  //获取漫画排行榜
  public getpaihang() {
    return this.httpService.get('http://app.u17.com/v3/app/android/phone/rank/list?sortVersion=2', null);
  }
  //获取漫画排行榜详情
  public getPaiList(argValue, page) {
    // tslint:disable-next-line:max-line-length
    return this.httpService.get('http://app.u17.com/v3/app/android/phone/list/index?size=40&page=' + page + '&argName=sort&argValue=' + argValue + '&con=1', null);
  }
  //获取漫画分类
  public getFenLei() {
    return this.httpService.get('http://app.u17.com/v3/app/android/phone/sort/list?sortVersion=1244', null);
  }

  // tslint:disable-next-line:max-line-length
  // 今日首页  http://app.u17.com/v3/appV3_3/android/phone/comic/todayRecommend?android_id=606dc724ed555018&v=3400100&model=HUAWEI+MLA-AL10&come_from=null 
  // 今日详情  http://app.u17.com/v3/appV3_3/android/phone/comic/todayItem?v=3400100&android_id=606dc724ed555018&model=HUAWEI+MLA-AL10&come_from=&htmlId=222 
  // 弹幕列表  http://app.u17.com/v3/appV3_3/android/phone/comment/customCommentList?v=3400100&android_id=606dc724ed555018&model=HUAWEI+MLA-AL10&page=1&thread_id=28798128&come_from=&parent_id=0
  // 推荐首页   http://app.u17.com//v3/appV3_3/android/phone/comic/boutiqueListNew?sexType=1&android_id=606dc724ed555018&v=3400100&model=HUAWEI+MLA-AL10&come_from=null 
  // vip 首页 http://app.u17.com/v3/appV3_3/android/phone/list/vipList?android_id=606dc724ed555018&v=3400100&model=HUAWEI+MLA-AL10&come_from=null
  // 订阅首页  http://app.u17.com/v3/appV3_3/android/phone/list/newSubscribeList?android_id=606dc724ed555018&v=3400100&model=HUAWEI+MLA-AL10&come_from=null 
  // 目录页  http://app.u17.com/v3/appV3_3/android/phone/comic/detail_static_new?comicid=38368&v=3400100&android_id=606dc724ed555018&model=HUAWEI+MLA-AL10&come_from=null
  // 看漫画  http://app.u17.com/v3/appV3_3/android/phone/comic/chapterNew?v=3400100&android_id=606dc724ed555018&model=HUAWEI+MLA-AL10&chapter_id=152258&come_from=null
}
