//index.js
const app = getApp()

Page({
  data: {
    avatarUrl: './user-unlogin.png',
    userInfo: {},
    logged: false,
    takeSession: false,
    eye: true,
    open: false,
    requestResult: '',
    goods_img: [
      { 'img': 'http://img02.tooopen.com/images/20150928/tooopen_sy_143912755726.jpg' },
      { 'img': 'http://img02.tooopen.com/images/20150928/tooopen_sy_143912755726.jpg' },
      { 'img': 'http://img02.tooopen.com/images/20150928/tooopen_sy_143912755726.jpg' },
      { 'img': 'http://img02.tooopen.com/images/20150928/tooopen_sy_143912755726.jpg' },
    ],
    indicatorDots: true,
    autoplay: true,
    interval: 5000,
    duration: 1000,
  },

  onLoad: function() {
    if (!wx.cloud) {
      wx.redirectTo({
        url: '../chooseLib/chooseLib',
      })
      return
    }
    
    // 获取用户信息
    wx.getSetting({
      success: res => {
        if (res.authSetting['scope.userInfo']) {
          // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
          wx.getUserInfo({
            success: res => {
              this.setData({    
                avatarUrl: res.userInfo.avatarUrl,
                userInfo: res.userInfo
              })
            },
            fail: res => {
              console.log(res)
              _this.setData({
                open: false
              })
            }
          })
        }
      }
    })
  },
  onShow: function (options) {
    this.getUserInfoFun()
  },
  showPrePage: function () {
    this.setData({
      eye: false
    })
  },
  getUserInfoFun: function () {
    var S = this;
    wx.getUserInfo({
      success: function (res) {
        S.setData({
          avatarUrl: res.userInfo.avatarUrl,
          userInfo: res.userInfo
        })
        // S.adduser(res);
        console.log(res)       　　　　　　　//do anything
      },
      fail: S.showPrePage
    })
  },


  adduser: function (e){
    console.log(e)
    const db = wx.cloud.database()
    db.collection('userInfo').add({
      data: {
        username: e.userInfo.nickName,
        state:'01',
        isfree:'01',
        code:''
      },
      success: res => {
        // 在返回结果中会包含新创建的记录的 _id
        this.setData({
          username: e.userInfo.nickName
        })
        wx.showToast({
          title: '新增记录成功',
        })
        console.log('[数据库] [新增记录] 成功，记录 _id: ', res._id)
      },
      fail: err => {
        wx.showToast({
          icon: 'none',
          title: '新增记录失败'
        })
        console.error('[数据库] [新增记录] 失败：', err)
      }
    })
  }

})
