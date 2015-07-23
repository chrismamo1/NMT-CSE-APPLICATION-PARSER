#!/usr/bin/python
import student

def main():
    tsv = open("apps.tsv", 'r')
    apps = tsv.read()
    apps = apps.split('\n')
    tmp = apps[1].split('\t')
    head = student.Student(tmp)
    lst = student.ListStudent(head)
    for i in range (1, len(apps)):
        print (i)
        tmp = apps[i].split('\t')
        tmp2 = student.Student(tmp)
        lst.insert(tmp)
    tsv.close()
    
    pfile = open("cse101.txt", 'w')
    tmp = lst.head
    print (lst.head.timestmp)
    print (tmp.next_node)
    while tmp.next_node != None:
        if tmp.cse101 == 'Yes' or tmp.cse101 == 'Preferred' or tmp.cse101 == 'If Needed':
            print(tmp.fname)
        tmp = tmp.next_node
    
    pfile.close()
if __name__ == '__main__':
    main()
