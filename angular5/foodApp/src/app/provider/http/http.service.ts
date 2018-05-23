import { Injectable } from '@angular/core';
import {
    Http,
    Response,
    Headers,
    RequestOptions,
    URLSearchParams,
    RequestOptionsArgs,
    RequestMethod
  } from '@angular/http';
import {Utils} from '../util/utils';
import { APP_SERVE_URL } from '../Constants';
// tslint:disable-next-line:import-blacklist
import {Observable} from 'rxjs';
import { SpinService } from '../../components/common/spin/spin.service';



/**
 * http服务
 */
@Injectable()
export class HttpService {
    REQUEST_TIMEOUT = 10000;
    constructor(
      private http: Http,
      private spinService: SpinService,
    ) {}

      /**
   * 请求远程数据
   * @param url 请求地址
   * @param options 请求配置
   */
  public request(url: string, options: RequestOptionsArgs): Observable<Response> {
    // 转换url地址，若为绝对路径，则不变，若为相对路径，则补充接口前缀地址
    url = url.startsWith('http') ? url : APP_SERVE_URL + url;

    // 增加token
    //options = this.optionsAddToken(options);

    // 创建请求
    return Observable.create(observer => {
      // 显示加载状态
      this.spinService.spin(true);
      // 请求
      this.http.request(url, options)
        //.timeout(this.REQUEST_TIMEOUT)// 设置超时时间
        //.map(res => res.json())// 转换为json对象
        .subscribe((res: any) => {// 订阅请求返回结果
          res = res.json();
          // 隐藏加载状态
          this.spinService.spin(false);
          if (res.code == 1) {
            observer.next(res.data.returnData);
          } else {
            alert(res.msg);
          }
        }, err => {// 请求失败
          this.requestFailed(url, options, err); //处理请求失败
          observer.error(err);
        });
    });
  }

      /**
   * get请求
   * @param url 请求地址
   * @param param 请求参数
   */
  public get(url: string, param: any = null): Observable<Response> {
    return this.request(url, {
      method: RequestMethod.Get,
      search: this.buildURLSearchParams(param)
    });
  }
/**
   * post请求【json格式参数】
   * @param url 请求地址
   * @param param 请求参数
   */
  public post(url: string, param: any = {}): Observable<Response> {
    return this.request(url, new RequestOptions({
      method: RequestMethod.Post,
      body: param,
      headers: new Headers({
        'Content-Type': 'application/json; charset=utf-8'
      })
    }));
  }

  /**
   * post请求【form格式参数】
   * @param url 请求地址
   * @param param 请求参数
   */
  public postForm(url: string, param: any = null): Observable<Response> {

    return this.request(url, new RequestOptions({
      method: RequestMethod.Post,
      body: this.buildURLSearchParams(param),
      headers: new Headers({
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
      })
    }));

  }

  /**
   * put请求
   * @param url 请求地址
   * @param param 请求参数
   */
  public put(url: string, param: any = {}): Observable<Response> {
    return this.request(url, new RequestOptions({
      method: RequestMethod.Put,
      body: param
    }));
  }

  /**
   * delete请求
   * @param url 请求地址
   * @param param 请求参数
   */
  public delete(url: string, param: any = null): Observable<Response> {
    return this.request(url, new RequestOptions({
      method: RequestMethod.Delete,
      body: param
    }));
  }

  /**
   * patch请求
   * @param url 请求地址
   * @param param 请求参数
   */
  public patch(url: string, param: any = {}): Observable<Response> {
    return this.request(url, new RequestOptions({
      method: RequestMethod.Patch,
      body: param
    }));
  }

  /**
   * head请求
   * @param url 请求地址
   * @param param 请求参数
   */
  public head(url: string, param: any = null): Observable<Response> {
    return this.request(url, new RequestOptions({
      method: RequestMethod.Head,
      search: param
    }));
  }

  /**
   * options请求
   * @param url 请求地址
   * @param param 请求参数
   */
  public options(url: string, param: any = null): Observable<Response> {
    return this.request(url, new RequestOptions({
      method: RequestMethod.Options,
      search: param
    }));
  }


    

    /**
     * 将对象转为查询参数
     * @param paramMap
     * @returns {URLSearchParams}
     */
    private  buildURLSearchParams(paramMap): URLSearchParams {
        const params = new URLSearchParams();
        if (!paramMap) {
            return params;
        }
        for (const key in paramMap) {
            let val = paramMap[key];
            if (val instanceof Date) {
                val = Utils.dateFormat(val, 'yyyy-MM-dd hh:mm:ss');
            }
            params.set(key, val);
        }
        return params;
    }




    /**
     * 处理请求失败事件
     * @param url
     * @param options
     * @param err
     */
    private requestFailed(url: string, options: RequestOptionsArgs, err) {

        let msg = '请求发生异常';
        const status = err.status;
        msg = url + options + msg;
        if (status === 0) {
            msg = '请求失败，请求响应出错';
        } else if (status === 404) {
            msg = '请求失败，未找到请求地址';
        } else if (status === 500) {
            msg = '请求失败，服务器出错，请稍后再试';
        } else {
            msg = '未知错误，请检查网络';
        }
        return msg;
    }
}
