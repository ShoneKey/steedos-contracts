# 华炎合同管理系统

![界面效果图](https://steedos.github.com/docs/assets/mac_ipad_iphone_home.png)

合同管理是落实企业风险管理和内部控制的一项核心的管理业务，合同管理的好坏直接影响企业的经营绩效。

华炎合同管理系统是国内首个全功能的开源合同管理解决方案，以合同为中心，通过合同订立、执行、监督、统计及维护跟踪，在规避法律风险的同时实现合同价值最大化。

- [视频演示](https://www-steedos-com.oss-cn-beijing.aliyuncs.com/videos/creator/contracts-demo.mp4)
- [开发文档](https://steedos.github.io)

### 管合同

对公司所有的合同进行分类管理，包括合同的对方单位、签订日期、金额、履约状态、分类等基本要素，以及合同的应收应付、实收实付、验收状态、开票记录等相关表信息。

通过配置列表视图，开发人员可以呈现个性化的列表界面给用户，包括列表中显示的字段、排序规则、数据筛选条件，并可指定常用字段为筛选字段，由最终用户筛选，进行数据过滤。双击列表中的字段，可以快捷更改记录的内容。

点击合同标题，即可进入合同查看页面。业务对象的所有字段均通过[配置文件](src)申明，如需新增字段，或是修改字段的类型、显示名称、可选项、相关表、字段分组、显示顺序等，均可通过修改配置文件满足业务需求。例如对于外资企业，可以增加币种字段；对于上市公司，可以增加是否关联交易字段；对于服务类合同，可以记录合同的开始日期和结束日期。在合同查看页面双击字段名，一样可以快捷修改。

除了显示合同的基本要素，合同查看页面还列出了合同的应收应付、实收实付、验收状态、开票记录等相关表信息。业务人员可以在同一个界面中对合同相关信息有全面的了解，还可以快捷的为此合同创建相关付款记录。而实现这些功能，只需要在配置文件中配置对象的关联属性即可。

### 管对方单位

合同台账中可以设定对方单位相关表，将公司的客户、供应商进行统一登记管理。可以记录单位的类别、优先级、基本资料以及相关的联系人等信息，可以对单位的历史信誉进行评分和评价。点击单位名称，可以查看到与此单位签订的所有合同清单、应收应付以及待办任务。新增合同时可从单位主数据库中选择，也可以创建新的单位。

### 管资金

合同台账可以设定应收应付子表，可在合同签订阶段登记合同约定的应收应付日期、合同的开票日期等信息。并在实际付款流程走完之后更新相关信息。通过对应收应付数据的统计，可以实现对未来1个月～1年的应收、应付账款进行预算，帮助财务部门做好资金准备。

### 管进度

对于合同中需要分配的任务和需要提醒的预警信息，可以配置任务子表，对每个合同创建待办任务。任务可以分派给具体的责任人，可以指定提醒日期。责任人可以在统一的界面中汇总查看来自各个合同中的待办任务，并通过月历视图浏览每个月的任务安排。

### 管权限

通过配置合同对象的权限，可以限制经办人只能查看本人负责的合同、公司主管可以查看本单位的合同，集团领导可以查看集团所有合同。对于重要字段，例如金额、对方单位、履约状态等，还可以配置审计功能，对这些字段的任何修改，系统均会自动记录审计日志。

### 管统计分析

通过配置合同统计报表，可以按履约状态、按日期、按分类对合同进行多维度的汇总与分析。系统支持普通的列表统计、分类统计、二维表，支持通过可视化的界面对报表样式进行排版。对于复杂需求的报表，也可以通过javascript和html编写报表模版文件，实现完全个性化的统计分析。

### 管审批

通过与华炎审批王系统集成，配置合同审批流程，从合同的拟稿，部门初审，到相关部门的会审，到自动进入台账，均可自动完成。只需编写配置文件，审批单中的要素可自动映射为合同台账中的字段。开发人员还可以编写触发器，当审批单进入合同台账时进行必要的计算与处理。

![审批王界面效果图](https://www.steedos.com/cn/libs/img/workflow/int.png)

# 源码解析

每个企业因行业不同、规模不同、业务不同，合同管理的要素和侧重点也不一样。华炎合同管理系统基于Creator“低代码”平台开发，在提供强大功能的同时，按需定制也非常方便。开发人员无需编写代码，只需调整配置文件，即可快速满足业务部门的需求。

### 项目结构

项目核心源码非常简单，包括以下内容：
- [steedos-config.yml](steedos-config.yml)
- [src](src)
  - contract
    - [contracts.object.yml](src/contract/contracts.object.yml)
  - triggers
    - [contracts.object.js](src/triggers/contracts.object.js)

### 系统配置文件 
文件 [steedos-config.yml](steedos-config.yml) ，配置系统参数：
- 数据库连接方式；
- 附件存储位置；
- 服务端口和访问地址。

系统可以连接到默认的MongoDB数据库，也可以连接到第三方系统的Oracle, SQL Server, MySQL, PostgreSQL数据库。

### 对象配置文件 
文件 [src/contract/contracts.object.yml](src/contract/contracts.object.yml)，每一个业务对象是一个独立的配置文件。
- 设定对象的基本属性，例如显示名、数据表名、图标等；
- 设定对象启用的功能，包括：
  - 允许上传附件；
  - 允许全局搜索；
  - 允许创建任务；
  - 允许创建日程；
  - 允许发表评论；
  - 开通API接口；
  - 开启审计日志；
  - 启用回收站。
  
### 配置对象字段
开发人员可以配置对象的字段，Creator支持常见的字段类型：
  - 文本型；
  - 日期型；
  - 布尔型；
  - 数值型；
  - 选择型（单选、多选）；
  - 关联到相关表（单选、多选）。

开发人员可以设定字段的显示名称、描述、可选项、是否必填、分组显示等参数。
开发人员可以将字段关联到另一个对象，两个对象之间会自动创建关联关系，在查看主表记录时，自动显示相关的子表记录。 

### 配置列表视图：
开发人员可以配置对象的列表视图，一个对象可以由一个或多个列表视图组成。业务人员在前台操作时，可以很方便的切换列表视图，也可以自定义列表视图。

列表视图可以配置以下参数：
  - 选择列表显示的字段；
  - 设定排序规则；
  - 设定列表过滤条件；
  - 设定快捷过滤字段。

### 配置访问权限：
开发人员可以配置对象的默认访问权限，系统上线后，系统管理员也可以在设置界面中设置对象权限。

对象可以配置以下权限：
  - 允许创建；
  - 允许修改；
  - 允许删除；
  - 允许查看所有记录；
  - 允许修改所有记录；
高级权限配置：
  - 对于集团企业，可以设定只能查看、修改本单位的数据；
  - 对于敏感的业务数据，可以设定只能查看、修改部分字段。

### 触发器
触发器 [src/triggers/contracts.object.js](src/triggers/contracts.object.js)，业务逻辑触发器，可以在数据增删改发生时处理业务逻辑。
- 数据插入前；
- 数据插入后；
- 数据更新前；
- 数据更新后；
- 数据删除前；
- 数据删除后；

项目源码基于NodeJS，使用MongoDB数据库，可以轻松与您现有的NodeJS项目集成，或是通过系统提供的标准化ODATA、GraphQL接口与第三方业务系统集成。

# 源码安装与调试

### 安装前准备
- [Install NodeJS, v8.0 or later.](https://nodejs.org/en/)
- [Install MongoDB Community Server v3.4 or later](https://www.mongodb.com/download-center/community)
- [Install Visual Studio Code](https://code.visualstudio.com/)

### 安装 yarn
```
npm i yarn -g
```

### 使用yarn安装依赖包
```
yarn
```

### 启动服务器
```
yarn start
```


# 了解更多

[关于 Steedos 低代码开发平台](http://developer.steedos.com/)

