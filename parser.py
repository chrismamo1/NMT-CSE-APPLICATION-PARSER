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
        tmp = apps[i].split('\t')
        tmp2 = student.Student(tmp)
        lst.insert(tmp)
    tsv.close()
    #creates File    
    pfile = open("cse101.txt", 'w')
    tmp = lst.head
    while tmp.next_node != None:
        if tmp.cse101 == 'Yes' or tmp.cse101 == 'Preferred' or tmp.cse101 == 'If Needed':
            tmp.file_print(pfile)
        tmp = tmp.next_node
    pfile.close()
    #creates File    
    pfile = open("cse107.txt", 'w')
    tmp = lst.head
    while tmp.next_node != None:
        if tmp.cse107 == 'Yes' or tmp.cse107 == 'Preferred' or tmp.cse107 == 'If Needed':
            tmp.file_print(pfile)
        tmp = tmp.next_node
    pfile.close()
    #creates File    
    pfile = open("cse113.txt", 'w')
    tmp = lst.head
    while tmp.next_node != None:
        if tmp.cse113 == 'Yes' or tmp.cse113 == 'Preferred' or tmp.cse113 == 'If Needed':
            tmp.file_print(pfile)
        tmp = tmp.next_node
    pfile.close()
    #creates File    
    pfile = open("cse122.txt", 'w')
    tmp = lst.head
    while tmp.next_node != None:
        if tmp.cse122 == 'Yes' or tmp.cse122 == 'Preferred' or tmp.cse122 == 'If Needed':
            tmp.file_print(pfile)
        tmp = tmp.next_node
    pfile.close()
    #creates File    
    pfile = open("cse213.txt", 'w')
    tmp = lst.head
    while tmp.next_node != None:
        if tmp.cse213 == 'Yes' or tmp.cse213 == 'Preferred' or tmp.cse213 == 'If Needed':
            tmp.file_print(pfile)
        tmp = tmp.next_node
    pfile.close()
    #creates File    
    pfile = open("cse221.txt", 'w')
    tmp = lst.head
    while tmp.next_node != None:
        if tmp.cse221 == 'Yes' or tmp.cse221 == 'Preferred' or tmp.cse221 == 'If Needed':
            tmp.file_print(pfile)
        tmp = tmp.next_node
    pfile.close()
    #creates File    
    pfile = open("cse222.txt", 'w')
    tmp = lst.head
    while tmp.next_node != None:
        if tmp.cse222 == 'Yes' or tmp.cse222 == 'Preferred' or tmp.cse222 == 'If Needed':
            tmp.file_print(pfile)
        tmp = tmp.next_node
    pfile.close()
    
if __name__ == '__main__':
    main()
