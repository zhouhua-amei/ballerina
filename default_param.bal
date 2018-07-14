import ballerina/io;

function printSalaryDetails(int baseSalary, int annulIncrement = 20, 
                            float bonusRate = 0.02){
    io:println("Base Salary: ", baseSalary,
                " | Annual Increment: ", annulIncrement,
                " | Bonus Rate: ", bonusRate);
}

function main(string... args) {
    printSalaryDetails(2500);
    printSalaryDetails(2500, annulIncrement = 100);
    printSalaryDetails(2500, bonusRate = 0.1);
    printSalaryDetails(2500, annulIncrement = 100, bonusRate = 0.1);
}