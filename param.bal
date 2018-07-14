import ballerina/io;
int total = 99;
public int count;

@final
public string ok = "ok";
@readonly
public int status = 1;
function main(string... args){
    io:println(total);
    count++;
    io:println(count);
    boolean available = false;
    io:println(available);
}