from django.shortcuts import render
from . import models
from rest_framework import viewsets
from django.contrib.auth.models import User, Group
from food.serializers import UserSerializer, GroupSerializer,FoodSerializer,FoodCategorySerializer
from food.models import food
from food.models import foodcategory

# Create your views here.
def home(request):
    foods=models.food.objects.all()
    return render(request, 'home.html', {'foods': foods})

def fooddetail(request,food_id):
    food=models.food.objects.get(pk=food_id)
    return render(request,'fooddetail.html',{'food':food})

class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer

class FoodViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = food.objects.all()
    serializer_class = FoodSerializer

class FoodCategoryViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = foodcategory.objects.all()
    serializer_class = FoodCategorySerializer


# def seller(resquest):
#     """
#        返回商家信息
#     @apiSuccess     {dict}      seller                 字典
#     @apiSuccess     {Int}       seller.name              商家名称
#     @apiSuccess     {Int}       seller.description              商家名称
#     @apiSuccess     {Int}       seller.deliveryTime              商家名称
#     @apiSuccess     {Int}       seller.score              商家名称
#     @apiSuccess     {Int}       seller.serviceScore              商家名称
#     @apiSuccess     {Int}       seller.foodScore              商家名称
#     @apiSuccess     {Int}       seller.rankRate              商家名称
#     @apiSuccess     {Int}       seller.minPrice              商家名称
#     @apiSuccess     {Int}       seller.deliveryPrice              商家名称
#     @apiSuccess     {Int}       seller.ratingCount              商家名称
#     @apiSuccess     {Int}       seller.bulletin              商家名称
#     @apiSuccess     {Int}       seller.supports                 商家活动列表
#     @apiSuccess     {Int}       seller.supports.type             商家活动类型
#     @apiSuccess     {Int}       seller.supports.description      商家活动描述
#     @apiSuccess     {Int}       seller.avatar                 商家活动描述
#     @apiSuccess     {Int}       seller.pics                 商家活动描述
#     @apiSuccess     {Int}       seller.infos                 商家活动描述
#      "seller": {
#         "name": "粥品香坊（回龙观）",
#         "description": "蜂鸟专送",
#         "deliveryTime": 38,
#         "score": 4.2,
#         "serviceScore": 4.1,
#         "foodScore": 4.3,
#         "rankRate": 69.2,
#         "minPrice": 20,
#         "deliveryPrice": 4,
#         "ratingCount": 24,
#         "sellCount": 90,
#         "bulletin": "粥品香坊其烹饪粥料的秘方源于中国千年古法，在融和现代制作工艺，由世界烹饪大师屈浩先生领衔研发。坚守纯天然、0添加的良心品质深得消费者青睐，发展至今成为粥类的引领品牌。是2008年奥运会和2013年园博会指定餐饮服务商。",
#         "supports": [
#           {
#             "type": 0,
#             "description": "在线支付满28减5"
#           },
#         ],
#         "avatar": "http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg",
#         "pics": [
#           "http://fuss10.elemecdn.com/8/71/c5cf5715740998d5040dda6e66abfjpeg.jpeg?imageView2/1/w/180/h/180",
#           "http://fuss10.elemecdn.com/b/6c/75bd250e5ba69868f3b1178afbda3jpeg.jpeg?imageView2/1/w/180/h/180",
#           "http://fuss10.elemecdn.com/f/96/3d608c5811bc2d902fc9ab9a5baa7jpeg.jpeg?imageView2/1/w/180/h/180",
#           "http://fuss10.elemecdn.com/6/ad/779f8620ff49f701cd4c58f6448b6jpeg.jpeg?imageView2/1/w/180/h/180"
#         ],
#         "infos": [
#           "该商家支持发票,请下单写好发票抬头",
#           "品类:其他菜系,包子粥店",
#           "北京市昌平区回龙观西大街龙观置业大厦底商B座102单元1340",
#           "营业时间:10:00-20:30"
#         ]
#       },
#        """
#     return HttpResponse("Hello seller ! ")

# def goods(resquest):
#     """
#        返回目录商品
#
#     @api {get} /stu/test/method/study/list/?tid=1  1 方法列表
#     @apiGroup 15
#
#     @apiName goods
#
#     @apiDescription    方法列表
#
#     @apiParam       {Int}       tid             主测试ID
#
#     @apiSuccess     {List}      goods                 列表
#     @apiSuccess     {Int}       goods.name              方法序号
#     @apiSuccess     {String}    goods.type          方法名称
#     @apiSuccess     {Int}       goods.foods          食物列表
#     @apiSuccess     {Int}       goods.foods.name          方法状态: 0:未学习  1:已学习
#     @apiSuccess     {Int}       goods.foods.price          方法状态: 0:未学习  1:已学习
#     @apiSuccess     {Int}       goods.foods.oldPrice         方法状态: 0:未学习  1:已学习
#     @apiSuccess     {Int}       goods.foods.description         方法状态: 0:未学习  1:已学习
#     @apiSuccess     {Int}       goods.foods.sellCount         方法状态: 0:未学习  1:已学习
#     @apiSuccess     {Int}       goods.foods.rating         方法状态: 0:未学习  1:已学习
#     @apiSuccess     {Int}       goods.foods.info         方法状态: 0:未学习  1:已学习
#     @apiSuccess     {Int}       goods.foods.ratings         评价列表
#     @apiSuccess     {Int}       goods.foods.ratings.username
#     @apiSuccess     {Int}       goods.foods.ratings.rateTime
#     @apiSuccess     {Int}       goods.foods.ratings.rateType
#     @apiSuccess     {Int}       goods.foods.ratings.text
#     @apiSuccess     {Int}       goods.foods.ratings.avatar
#     @apiSuccess     {Int}       goods.foods.icon         方法状态: 0:未学习  1:已学习
#     @apiSuccess     {Int}       goods.foods.image         方法状态: 0:未学习  1:已学习
#     :return:
#         {
#       "name": "精选热菜",
#       "type": -1,
#       "foods": [
#         {
#           "name": "娃娃菜炖豆腐",
#           "price": 17,
#           "oldPrice": "",
#           "description": "",
#           "sellCount": 43,
#           "rating": 92,
#           "info": "",
#           "ratings": [
#             {
#               "username": "3******c",
#               "rateTime": 1469281964000,
#               "rateType": 0,
#               "text": "菜量还可以,味道还可以",
#               "avatar": "http://static.galileo.xiaojukeji.com/static/tms/default_header.png"
#             }
#           ],
#           "icon": "http://fuss10.elemecdn.com/d/2d/b1eb45b305635d9dd04ddf157165fjpeg.jpeg?imageView2/1/w/114/h/114",
#           "image": "http://fuss10.elemecdn.com/d/2d/b1eb45b305635d9dd04ddf157165fjpeg.jpeg?imageView2/1/w/750/h/750"
#         },
#        """
#     return HttpResponse("Hello goods ! ")

# def ratings(resquest):
#     """
#        返回目录 排行
#        :param kids:目录关联知识点列表  [1,2,3]
#         @apiSuccess     {List}      ratings                 评价列表
#         @apiSuccess     {Int}       ratings.username              方法序号
#         @apiSuccess     {String}    ratings.rateTime          方法名称
#         @apiSuccess     {String}    ratings.deliveryTime          方法名称
#         @apiSuccess     {String}    ratings.score          方法名称
#         @apiSuccess     {String}    ratings.text          方法名称
#         @apiSuccess     {String}    ratings.avatar          方法名称
#         @apiSuccess     {String}    ratings.recommend          推荐列表
#        :return:
#         "ratings": [
#             {
#               "username": "3******c",
#               "rateTime": 1469281964000,
#               "deliveryTime": 30,
#               "score": 5,
#               "rateType": 0,
#               "text": "不错,粥很好喝,我经常吃这一家,非常赞,以后也会常来吃,强烈推荐.",
#               "avatar": "http://static.galileo.xiaojukeji.com/static/tms/default_header.png",
#               "recommend": [
#                 "南瓜粥",
#                 "皮蛋瘦肉粥",
#                 "扁豆焖面",
#                 "娃娃菜炖豆腐",
#                 "牛肉馅饼"
#               ]
#             },
#           ]
#        """
#     return HttpResponse("Hello ratings ! ")