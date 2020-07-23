**linux系统中的Load**： 是对当前CPU工作量的度量 (WikiPedia: the system load is a measure of the amount of work that a computer system is doing)。也有简单的说是进程队列的长度。

#### 什么样的Load average值要提高警惕

- **0.7 < load < 1:** 此时是不错的状态，如果进来更多的汽车，你的马路仍然可以应付。
- **load = 1:** 你的马路即将拥堵，而且没有更多的资源额外的任务，赶紧看看发生了什么吧。
- **load > 5:** 非常严重拥堵，我们的马路非常繁忙，每辆车都无法很快的运行

