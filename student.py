class Student:
    def __init__(self, inlist, next_node=None):
        self.time = inlist[0]
        self.fname = inlist[1]
        self.lname = inlist[2]
        self.next = 0;
    def get_next(self):
        return self.next_node
    def set_next(self, new_next):
        self.next_node = new_next
        
class ListStudent
    def __init__(self, head=None)
        self.head = head
    def insert(self, data):
        new_node = Student(data)
        new_node.set_next(self.head)
        self.head = new_head