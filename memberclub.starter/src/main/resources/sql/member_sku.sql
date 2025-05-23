-- 用于单测使用的 H2 数据库初始化

 SET MODE MYSQL;

CREATE TABLE IF NOT EXISTS member_sku (
    id BIGINT(20)  NOT NULL COMMENT '表主键',
    biz_type INT(11)  NOT NULL COMMENT '产品线',
    status INT(11)  NOT NULL COMMENT '商品状态 上下架',
    sale_info TEXT NOT NULL COMMENT '售卖信息',
    finance_info TEXT NOT NULL COMMENT '结算信息',
    view_info TEXT NOT NULL COMMENT '展示信息',
    performance_info TEXT NOT NULL COMMENT '履约信息',
    restrict_info TEXT NOT NULL COMMENT '限制信息',
    inventory_info TEXT NOT NULL COMMENT '库存信息',
    extra TEXT NOT NULL COMMENT '扩展属性',
    utime BIGINT(20)  NOT NULL DEFAULT '0' COMMENT '更新时间',
    ctime BIGINT(20)  NOT NULL DEFAULT '0' COMMENT '创建时间',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS inventory (
    id BIGINT(20)  NOT NULL AUTO_INCREMENT COMMENT '表主键',
    biz_type INT(11)  NOT NULL COMMENT '产品线',
    target_id BIGINT(20)  NOT NULL COMMENT '目标对象ID',
    target_type INT(11)  NOT NULL COMMENT '目标对象类型',
    sub_key VARCHAR(128) NOT NULL COMMENT '库存子 key',
    sale_count BIGINT(20)  NOT NULL COMMENT '售卖数量',
    total_count BIGINT(20)  NOT NULL COMMENT '库存总量',
    status INT(11)  NOT NULL COMMENT '商品库存状态',
    stime BIGINT(20)  NOT NULL DEFAULT '0' COMMENT '开始时间',
    etime BIGINT(20)  NOT NULL DEFAULT '0' COMMENT '截止时间',
    version BIGINT(20)  NOT NULL COMMENT '版本号',
    utime BIGINT(20)  NOT NULL DEFAULT '0' COMMENT '更新时间',
    ctime BIGINT(20)  NOT NULL DEFAULT '0' COMMENT '创建时间',
    PRIMARY KEY (id),
    UNIQUE KEY uniq_inventory (target_id, sub_key, target_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;



CREATE TABLE IF NOT EXISTS inventory_record (
    id BIGINT(20)  NOT NULL AUTO_INCREMENT COMMENT '表主键',
    biz_type INT(11)  NOT NULL COMMENT '产品线',
    user_id BIGINT(20)  NOT NULL COMMENT 'userId',
    inventory_key VARCHAR(128) NOT NULL COMMENT '库存 ID',
    target_id BIGINT(20)  NOT NULL COMMENT '目标对象 Id',
    target_type INT(11)  NOT NULL COMMENT '目标对象类型',
    sub_key VARCHAR(128) NOT NULL COMMENT '库存子 key',
    operate_key VARCHAR(128) NOT NULL COMMENT '库存操作幂等 key',
    op_count BIGINT(20)  NOT NULL COMMENT '操作数量',
    op_type INT(11)  NOT NULL COMMENT '操作方向 1扣减, 2回补',
    utime BIGINT(20)  NOT NULL DEFAULT '0' COMMENT '更新时间',
    ctime BIGINT(20)  NOT NULL DEFAULT '0' COMMENT '创建时间',
    PRIMARY KEY (id),
    UNIQUE KEY uniq_inventory_record (user_id, operate_key, inventory_key, op_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

use member_sku;
INSERT INTO member_sku (id,biz_type,status,sale_info,finance_info,view_info,performance_info,restrict_info,inventory_info,extra,utime,ctime) VALUES
   (200401,1,0,'{"originPriceFen":4500,"salePriceFen":4000}','{"contractorId":"438098434","settlePriceFen":4000,"periodCycle":3,"financeProductType":1}','{"displayImage":"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.alicdn.com%2Fbao%2Fuploaded%2Fi3%2F519685624%2FO1CN01Bb37dO1rPq9taBeml_%21%21519685624.jpg&refer=http%3A%2F%2Fimg.alicdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1742992970&t=a2e8db0911c3f759c109d95b5dc0082a","displayName":"京西Plus会员季卡","displayDesc":"有效期3个月;每月6张免运费券;Plus会员专属价","internalName":"电商会员季卡","internalDesc":"电商会员季卡"}','{"configs":[{"bizType":1,"rightType":4,"rightId":32424,"totalCount":6,"periodCount":31,"periodType":1,"cycle":3,"providerId":"1","grantInfo":{},"settleInfo":{"contractorId":"438098434","settlePriceFen":30,"financeAssetType":4,"financeable":true},"viewInfo":{"displayName":"免运费券"},"saleInfo":{}},{"bizType":1,"rightType":5,"rightId":32423,"totalCount":2147483647,"periodCount":31,"periodType":1,"cycle":3,"providerId":"2","grantInfo":{},"settleInfo":{"contractorId":"438098434","settlePriceFen":0,"financeAssetType":5,"financeable":false},"viewInfo":{"displayName":"会员价权益"},"saleInfo":{}},{"bizType":1,"rightType":3,"rightId":32425,"totalCount":2147483647,"periodCount":31,"periodType":1,"cycle":3,"providerId":"3","grantInfo":{},"settleInfo":{"contractorId":"438098434","settlePriceFen":0,"financeAssetType":3,"financeable":false},"viewInfo":{"displayName":"会员身份"},"saleInfo":{}}]}','{"enable":false}','{"enable":false,"type":0}','{}',1741506379765,1741506379765),
  (200402,1,0,'{"originPriceFen":1800,"salePriceFen":1500}','{"contractorId":"438098434","settlePriceFen":1800,"periodCycle":1,"financeProductType":1}','{"displayImage":"https://img0.baidu.com/it/u=973101599,73999428&fm=253&fmt=auto&app=138&f=JPEG?w=400&h=400","displayName":"京西Plus会员月卡","displayDesc":"有效期31天;6张免运费券;Plus会员专属价","internalName":"电商会员月卡","internalDesc":"电商会员月卡"}','{"configs":[{"bizType":1,"rightType":4,"rightId":32424,"totalCount":6,"periodCount":31,"periodType":1,"cycle":1,"providerId":"1","grantInfo":{},"settleInfo":{"contractorId":"438098434","settlePriceFen":30,"financeAssetType":4,"financeable":true},"viewInfo":{"displayName":"免运费券"},"saleInfo":{}},{"bizType":1,"rightType":5,"rightId":32423,"totalCount":2147483647,"periodCount":31,"periodType":1,"cycle":1,"providerId":"2","grantInfo":{},"settleInfo":{"contractorId":"438098434","settlePriceFen":0,"financeAssetType":5,"financeable":false},"viewInfo":{"displayName":"会员价权益"},"saleInfo":{}},{"bizType":1,"rightType":3,"rightId":32425,"totalCount":2147483647,"periodCount":31,"periodType":1,"cycle":1,"providerId":"3","grantInfo":{},"settleInfo":{"contractorId":"438098434","settlePriceFen":0,"financeAssetType":3,"financeable":false},"viewInfo":{"displayName":"会员身份"},"saleInfo":{}}]}','{"enable":false}','{"enable":false,"type":0}','{}',1741506380325,1741506380325),
  (200403,2,0,'{"originPriceFen":1000,"salePriceFen":600}','{"contractorId":"438098434","settlePriceFen":600,"periodCycle":1,"financeProductType":1}','{"displayImage":"https://img2.baidu.com/it/u=1205011088,2487597334&fm=253&fmt=auto&app=138&f=JPEG?w=530&h=500","displayName":"10元立减券","displayDesc":"无门槛立减券10元;有效期14天;过期退;有效期内限购4次","internalName":"10元立减券","internalDesc":"无门槛立减券10元"}','{"configs":[{"bizType":2,"rightType":1,"rightId":32423,"totalCount":1,"periodCount":14,"periodType":1,"cycle":1,"providerId":"1","grantInfo":{},"settleInfo":{"contractorId":"438098434","settlePriceFen":1000,"financeAssetType":1,"financeable":true},"viewInfo":{"displayName":"10元立减券"},"saleInfo":{}}]}','{"enable":true,"restrictItems":[{"periodType":"TOTAL","periodCount":14,"itemType":"TOTAL","userTypes":["USERID"],"total":4}]}','{"enable":false,"type":0}','{}',1741506380327,1741506380327),
  (200404,2,0,'{"originPriceFen":1500,"salePriceFen":900}','{"contractorId":"438098434","settlePriceFen":900,"periodCycle":1,"financeProductType":1}','{"displayImage":"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.alicdn.com%2Fbao%2Fuploaded%2Fi3%2F374544688%2FO1CN016Zx2lK1kV9QkrD6gW_%21%210-item_pic.jpg&refer=http%3A%2F%2Fimg.alicdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1742951021&t=9c87d26097559e952d220dff49a9d060","displayName":"15元混合券包","displayDesc":"无门槛组合券15元;有效期14天;过期退;有效期内限购4次","internalName":"15元混合券包","internalDesc":"无门槛组合券15元"}','{"configs":[{"bizType":2,"rightType":1,"rightId":32424,"totalCount":1,"periodCount":14,"periodType":1,"cycle":1,"providerId":"1","grantInfo":{},"settleInfo":{"contractorId":"438098434","settlePriceFen":500,"financeAssetType":1,"financeable":true},"viewInfo":{"displayName":"5元立减券"},"saleInfo":{}},{"bizType":2,"rightType":1,"rightId":32423,"totalCount":1,"periodCount":14,"periodType":1,"cycle":1,"providerId":"1","grantInfo":{},"settleInfo":{"contractorId":"438098434","settlePriceFen":1000,"financeAssetType":1,"financeable":true},"viewInfo":{"displayName":"10元立减券"},"saleInfo":{}}]}','{"enable":true,"restrictItems":[{"periodType":"TOTAL","periodCount":14,"itemType":"TOTAL","userTypes":["USERID"],"total":4}]}','{"enable":false,"type":0}','{}',1741506380330,1741506380330),
  (200405,8,0,'{"originPriceFen":100000,"salePriceFen":80000}','{"contractorId":"438098434","settlePriceFen":80000,"periodCycle":1,"financeProductType":1}','{"displayImage":"https://img0.baidu.com/it/u=3749790905,1458087113&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500","displayName":"小学3年级数学春季课","displayDesc":"清北名师;20节课程;随时退;赠送200元购课券","internalName":"小学3年级数学春季课","internalDesc":"小学3年级数学春季课"}','{"configs":[{"bizType":8,"rightType":6,"rightId":32424,"totalCount":20,"periodCount":31,"periodType":3,"cycle":1,"providerId":"2","grantInfo":{"startTime":1750146380332,"endTime":1752738380332},"settleInfo":{"contractorId":"438098434","settlePriceFen":80000,"financeAssetType":6,"financeable":true},"viewInfo":{"displayName":"线上大班课"},"saleInfo":{}},{"bizType":8,"rightType":1,"rightId":32423,"totalCount":1,"periodCount":31,"periodType":1,"cycle":1,"providerId":"1","grantInfo":{},"settleInfo":{"contractorId":"438098434","settlePriceFen":0,"financeAssetType":1,"financeable":false},"viewInfo":{"displayName":"购课立减优惠券200元"},"saleInfo":{}}]}','{"enable":false}','{"enable":false,"type":0}','{}',1741506380332,1741506380332),
  (200406,8,0,'{"originPriceFen":100000,"salePriceFen":80000}','{"contractorId":"438098434","settlePriceFen":80000,"periodCycle":1,"financeProductType":1}','{"displayImage":"https://img0.baidu.com/it/u=3749790905,1458087113&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500","displayName":"小学3年级语文春季课","displayDesc":"清北名师;20节课程;随时退","internalName":"小学3年级语文春季课","internalDesc":"小学3年级语文春季课"}','{"configs":[{"bizType":8,"rightType":6,"rightId":32424,"totalCount":20,"periodCount":31,"periodType":3,"cycle":1,"providerId":"2","grantInfo":{"startTime":1750146380334,"endTime":1752738380334},"settleInfo":{"contractorId":"438098434","settlePriceFen":80000,"financeAssetType":6,"financeable":true},"viewInfo":{"displayName":"线上大班课"},"saleInfo":{}}]}','{"enable":false}','{"enable":false,"type":0}','{}',1741506380334,1741506380334);
