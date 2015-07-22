#!/usr/bin/python
import student

def main():
    tsv = open("apps.tsv", 'r')
    apps = tsv.read()
    apps = apps.split('\n')
    tmp = apps[1]
    head = student.Student(tmp)
    lst = student.ListStudent(head)
    for i in range (2, len(apps)):
        #lst.insert(student.Student(apps[i]))
     
    tsv.close()

if __name__ == '__main__':
    main()
