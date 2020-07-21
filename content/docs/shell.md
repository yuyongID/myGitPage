## Shell 记录

#### 计算用命令列表

| 命令                   | 意义                                                         |
| :--------------------- | ------------------------------------------------------------ |
| `sort -k1 -nr`         | `sort` 排列计算，不带参数会将元素归类；`-k1` 以第一列为关键词；`-nr`的`n`代表关键词是 number 数字，`r` 代表 reverse 倒叙输出。 |
| `uniq -c`              | `uniq` 省略重复行。`-c`代表计数                              |
| `date +%d/%b/%Y:%H:%M` | Nginx 日志日期格式的 `data`，`date -d '-1 minute' +%d/%b/%Y:%H:%M`当前时间的前一分钟 |
|                        |                                                              |



#### AWK 需要记录的内建变量

| 变量名 | 意义                                                   |
| ------ | ------------------------------------------------------ |
| $0     | 整行的内容                                             |
| NR     | 从1开始的行数                                          |
| OFS    | 输出字段分隔符，`OFS="\t"`输出用制表符来分列           |
| NF     | 当前记录中的字段个数，就是有多少列。`$NF` 最后一列数据 |



#### AWK 正则与 grep 的对比

```bash
# 下面操作相等
grep "TIME_WAIT" netstat.txt
awk '/TIME_WAIT/' netstat.txt

# 下面操作相等
grep -v "TIME_WAIT" netstat.txt
awk '!/TIME_WAIT/' netstat.txt

```

#### 计算当前文件夹总大小

```bash
ls -l | awk 'NR!=1{sum+=$5}END{print sum}'
```

#### 计算 nginx 日志中 ip 数量前十

```bash
awk '{a[$1]++}END{for(i in a)print a[i]" "i}' access.log | sort -k1 -nr | head -10
awk '{print $1}' access.log |sort | uniq -c | sort -k1 -nr | head -10
```

#### 统计日志中访问大于100次的 IP

```bash
awk '{a[$1]++}END{for(i in a)if{a[i]>100 print a[i]", "i}}' access.log
```

#### 统计某时间段内访问最多的10个IP

```bash
awk '$4>="[9/Apr/2016:00:00:01" && $4<="[9/Apr/2016:23:59:59" {a[$1]++}END{for(i in a)print a[i],i}' access.log |sort -k1 -nr|head -n10
```

#### 统计每个URL访问内容的总大小（$body_bytes_sent）

```bash
awk '{a[$7]++;size[$7]+=$10}END{for(i in a)print a[i],size[i],i}' access.log
```

#### 统计访问状态码为404的IP及出现次数

```bash
awk '{if($9~/404/)a[$1" "$9]++}END{for(i in a)print i,a[i]}' access.log
```

