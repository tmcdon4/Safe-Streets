# Safe Streets

#Imports
import math
import random
import time
import sys

#Classes
class Officer:
    def __init__(self, name, position):
        self.name = name
        self.position = position
        
    def __str__(self):
        return f'Officer {self.name} is a {self.position}.'
    
    def patrol(self):
        message = f'Officer {self.name} is patrolling the area.'
        print(message)

class Citizen:
    def __init__(self, name, age):
        self.name = name
        self.age = age
        
    def __str__(self):
        return f'{self.name} is {self.age} years old.'
    
    def report(self, police):
        message = f'{self.name} is reporting suspicious activity to {police.name}.'
        print(message)

#Functions
def check_area(officers):
    print('Checking the area for suspicious activity...')
    time.sleep(1)
    if random.randint(1,10) < 5:
        print('Suspicious activity detected!')
        for officer in officers:
            officer.patrol()
    else:
        print('No suspicious activity detected.')

def call_911(citizen, police):
    print('911 call received...')
    citizen.report(police)
    print('Officer dispatched to scene...')
    police.patrol()
    
#Main
def main():
    officers = []
    officers.append(Officer('John Smith', 'Sergeant'))
    officers.append(Officer('Jane Smith', 'Detective'))
    
    citizens = []
    citizens.append(Citizen('Jim Johnson', 32))
    citizens.append(Citizen('Jill Johnson', 28))
    
    check_area(officers)
    
    call_911(citizens[0], officers[1])
    
#Run Program
if __name__ == '__main__':
    main()