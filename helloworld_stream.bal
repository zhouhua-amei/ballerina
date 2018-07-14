import ballerina/io;
import ballerina/runtime;
type StatusCount record {
    string status;
    int totalCount;
};

type Teacher record {
    string name;
    int age;
    string status;
    string batch;
    string school;
};

function testAggregationQuery(
    stream<StatusCount> filteredStatusCountStream,
    stream<Teacher> teacherStream) {
    forever {
        from teacherStream where age > 18 window lengthBatch(3)
        select status, count(status) as totalCount
        group by status
        having totalCount > 1
        => (StatusCount[] status) {
            filteredStatusCountStream.publish(status);
        }
    }
}

function main(string... args) {
    stream<StatusCount> filteredStatusCountStream;

    stream<Teacher> teacherStream;

    testAggregationQuery(filteredStatusCountStream, teacherStream);

    Teacher t1 = {name: "Sam", age: 25, status: "single",
        batch: "LK2014", school: "Hampden High School"};
    Teacher t2 = {name: "Jordan", age: 33, status: "single",
        batch: "LK1998", school: "Columbia High School"};
    Teacher t3 = {name: "Morgan", age: 45, status: "married",
        batch: "LK1988", school: "Central High School"};

    filteredStatusCountStream.subscribe(printStatusCount);

    teacherStream.publish(t1);
    teacherStream.publish(t2);
    teacherStream.publish(t3);

    runtime:sleep(1000);
}
function printStatusCount(StatusCount s) {
    io:println("Event received; status: " + s.status +
            ", total occurrences: " + s.totalCount);
}