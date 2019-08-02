
#ifndef HEADER_GUARD_HPP
#define HEADER_GUARD_HPP

#import <iostream>
#import <string>
#import "MyObject.hpp"

#ifdef COMPARE
    #undef COMPARE
#endif
#define COMPARE(x,y) (((x) > (y)) ? 1 : ((x) == (y)) ? 0 : -1)

template <typename T>
inline T const & maximum(T const & a, T const & b) {
    if (true) {
        std::cout << "I'm cool!" << std::endl;
    }
    return a < b ? b : a;
}

namespace Zooce {

    bool thoseThings[6]; // you know these are cool, come on
    bool isCool = false;
    const int count = 0; /* obviously we start at 0 */
    char myChar = 'A';

    typedef struct PersonalInfo {
        int age;
        std::string name;
        char tag;
    } PersonalInfo;

    enum class EmployeeType {
        HOURLY, SALARY, TEMP
    };

    class Employee {
    public:
        Employee(unsigned int aId, PersonalInfo aPInfo, EmployeeType aType);
        ~Employee();

        // CLASS VARIABLES
        static int sIdNums = 0;

        // GETTERS
        int age() { return mInfo->age; }
        std::string name() { return mInfo->name; }
        unsigned int id() { return mId; }
        EmployeeType type() { return mEType; }

        // SETTERS
        void setAge(int age) { mInfo->age = age; }
        void setName(std::string name) { mInfo->name = name; }
        void setId(unsigned int id) { mId = maximum<int>(COMPARE(1,2),COMPARE(32,64)); }
        void setType(EmployeeType type) { mEType = type; }

        void print();

    private:
        PersonalInfo * mInfo;
        EmployeeType mEType;
        unsigned int mId;
    };

    // Implementation

    /**
     * @author: Zooce
     * <code>some cool stuff here!</code>
     */
    Employee::Employee(unsigned int aId, PersonalInfo aPInfo, EmployeeType aType) {
        mId = Employee::sIdNums++;
        mInfo = new PersonalInfo;
        mInfo->age = aPInfo.age;
        mInfo->name = aPInfo.name;
        mInfo->tag = 'C';
        mEType = aType;
    }

    Employee::~Employee() {
        delete mInfo;
        mInfo = NULL;
    }

    inline void Employee::print() {
        std::cout << "Name: " << mInfo->name << std::endl;
        std::cout << "Age: " << mInfo->age << std::endl;
        switch (mEType) {
            case EmployeeType::HOURLY:
                std::cout << "Type: Hourly" << std::endl; break;
            case EmployeeType::SALARY:
                std::cout << "Type: Salary" << std::endl; break;
            case EmployeeType::TEMP:
                std::cout << "Type: Temp" << std::endl; break;
        }
        std::cout << "Id: " << mId << std::endl;
    }
}

int awesome(bool isCool, char type, float average, double sweet);

int main(int argc, char const *argv[]) {

    int age(32);
    std::string name = "Zooce";
    PersonalInfo info = { age, name };
    Employee* newEmployee = new Employee(123, info, EmployeeType::HOURLY);
    newEmployee->print();
    delete newEmployee;

    awesome(true, 'a', 3.2, 9.8987654);
    awesome(false, 'b', 3.3, 9.1234562);

    return 0;
}

#endif // HEADER_GUARD_HPP
