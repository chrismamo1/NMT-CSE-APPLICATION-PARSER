#!/usr/bin/python
import student

def main():
    tsv = open("apps.tsv", 'r')
    apps = tsv.read()
    apps = apps.split('\n')
    print(apps)
    #head = student.Student(apps(1))
    print (head.fname)    

    tsv.close()

if __name__ == '__main__':
    main()
