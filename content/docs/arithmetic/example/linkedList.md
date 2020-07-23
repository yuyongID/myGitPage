---
title: "链表 linked list"
---

## 链表 linked list

{{< expand "合并两个有序列表" "...">}}
```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func mergeTwoLists(l1 *ListNode, l2 *ListNode) *ListNode {
    result := &ListNode{}
    preHead := result
    for (l1 != nil && l2 != nil){
        if l1.Val < l2.Val {
            preHead.Next = l1
            l1 = l1.Next
        } else {
            preHead.Next = l2
            l2 = l2.Next
        }
        preHead = preHead.Next
    }
    if l1 == nil{
        preHead.Next = l2
    }
    if l2 == nil {
        preHead.Next = l1
    }
    return result.Next
}
```
{{< /expand>}}

{{< expand "反转链表" "...">}}
```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func reverseList(head *ListNode) *ListNode {
    if nil == head {
        return head
    }
    cur, next := head, head.Next
    for ; nil != next; cur, next, next.Next = next, next.Next, cur {
    }
    head.Next = nil
    return cur
}
```
{{< /expand>}}

{{< expand "删除链表中的节点" "...">}}
```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func deleteNode(node *ListNode) {
    node.Val, node.Next= node.Next.Val, node.Next.Next
}
```
{{< /expand>}}