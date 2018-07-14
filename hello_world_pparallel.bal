import ballerina/io;

function main(string... args){
    worker w1{
        io:println("Hello,World! #n");
    }
    worker w2{
        io:println("Hello,World! #w");
    }
    worker w3{
        io:println("Hello,World! #k");
    }
}