class Student:
    def __init__(self, inlist, next_node=None):
        self.timestmp = inlist[0]
        self.fname = inlist[1]
        self.lname = inlist[2]
        self.email = inlist[3]
        self.major = inlist[4]
        self.minor = inlist[5]
        self.standing = inlist[6]
        self.prev = inlist[7]
        self.hours = inlist[8]
        self.wrkstdy = inlist[9]
        self.cse101 = inlist[10]
        self.cse107 = inlist[11]
        self.cse113 = inlist[12]
        self.cse122 = inlist[13]
        self.cse213 = inlist[14]
        self.cse221 = inlist[15]
        self.cse222 = inlist[16]
        self.grader = inlist[17]
        self.ta = inlist[18]
        self.tutor = inlist[19]
        self.grd101 = inlist[20]
        self.grd107 = inlist[21]
        self.grd113 = inlist[22]
        self.grd122 = inlist[23]
        self.grd213 = inlist[24]
        self.grd221 = inlist[25]
        self.grd222 = inlist[26]
        self.python = inlist[27]
        self.c = inlist[28]
        self.java = inlist[29]
        self.data = inlist[30]
        self.pointers = inlist[31]
        self.lnkdlsts = inlist[32]
        self.gdb = inlist[33]
        self.times = inlist[34]
        self.prevwrk = inlist[35]
        self.reason = inlist[36]
        self.next_node = next_node
    def get_next(self):
        return self.next_node
    def set_next(self, new_next):
        self.next_node = new_next
    def file_print(self, pfile):
        pfile.write(''.join(('Student: ', self.fname, ' ', self.lname, '\n')))
        pfile.write(''.join(('  Email: ', self.email,'\n')))
        pfile.write(''.join(('  Major: ', self.major,'\n')))
        pfile.write(''.join(('  Minor: ', self.minor,'\n')))
        pfile.write(''.join(('  Class Standing (Fall 2015): ', self.standing,'\n\n')))
        pfile.write(''.join(('  Number of Hours Desired: ', self.hours,'\n')))
        pfile.write(''.join(('  Workstudy: ', self.wrkstdy,'\n\n')))
        pfile.write(''.join(('Previous courses:\n  ', self.prev,'\n\n')))
        pfile.write('Course Selection (preferred/yes/no)\n')
        pfile.write(''.join(('  CSE/IT 101: ', self.cse101,'\n')))
        pfile.write(''.join(('  CSE/IT 107: ', self.cse107,'\n')))
        pfile.write(''.join(('  CSE/IT 122: ', self.cse122,'\n')))
        pfile.write(''.join(('  CSE/IT 213: ', self.cse213,'\n')))
        pfile.write(''.join(('  CSE/IT 221: ', self.cse221,'\n')))
        pfile.write(''.join(('  CSE/IT 222: ', self.cse222,'\n\n')))
        pfile.write('Positions Interested in (preferred/yes/no)\n')
        pfile.write(''.join(('  Grader: ', self.grader,'\n')))
        pfile.write(''.join(('  TA: ', self.ta,'\n')))
        pfile.write(''.join(('  Tutor: ', self.tutor,'\n\n')))
        
        pfile.write('------------------------------------------------------\n\n')
        
        
class ListStudent:
    def __init__(self, head=None):
        self.head = head
    def insert(self, data):
        new_node = Student(data)
        new_head = new_node
        new_node.set_next(self.head)
        self.head = new_head