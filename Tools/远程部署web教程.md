---
tags:
  - 教程
---
步骤一：
- **在终端输入：`ssh root@10.168.100.11`（最终使用这个）**
- 如果提示输入 `password`，你可以试着输入你们公司常用的公共密码。（Zz@2018）
- 如果提示 `Permission denied`，按 `Ctrl + C` 退出。
- 再试一下：`ssh admin@10.168.100.11`

步骤二：
command+n开一个新的terminal输入
> scp /你的文件路径/文件名 root@10.168.100.11:/data/comercial（注意一次只能上传一个路径）

> # 1. 覆盖内层文件夹的 app.py
> scp "/Users/yixinyue/Desktop/工作相关/广告看板制作/Ads_BI/app.py" root@10.168.100.11:/data/comercial/Ads_BI/
> 
> # 2. 覆盖内层文件夹的 CSV 数据
> scp "/Users/yixinyue/Desktop/广告看板制作/Ads_BI/优化师账号维度目标.csv" root@10.168.100.11:/data/comercial/Ads_BI/

步骤三（在第一个terminal那里）
1、重启任务
> supervisorctl restart comercial_ads_bi

2、检查状态（确保看到 comercial_ads_bi 的状态是 RUNNING）。
> supervisorctl status

如果发现没有更新（看时间有没有更新）
> ls -l /data/comercial/Ads_BI


> 物流看板的app.py覆盖
> # 上传 app.py
> scp "/Users/yixinyue/Desktop/物流看板/app.py" root@10.168.100.11:/data/express_dashboard/
> 
> # 上传 sql_queries.py
> scp "/Users/yixinyue/Desktop/物流看板/sql_queries.py" root@10.168.100.11:/data/express_dashboard/
> 