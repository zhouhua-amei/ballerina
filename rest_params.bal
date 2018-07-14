import ballerina/io;
function printFruits(string separator,
                     string title = "Fruits: ",
                     string... concatStrings) {

    string finalStr;
    foreach index, str in concatStrings {
        if (index == 0) {
            finalStr = str;
        } else {
            finalStr = finalStr + ", " + str;
        }
    }
    io:println(title + finalStr);
}
function main(string... args) {
    printFruits(",");

    printFruits(",", "Apples");

    printFruits(",", title = "Available Fruits: ", "Apples");

    printFruits(",", "Apples", "Oranges");
    printFruits(",", title = "Available Fruits: ", "Apples", "Oranges",
                "Grapes");

    printFruits(",", "Apples", "Oranges", title = "Available Fruits: ",
                "Grapes");

    string[] fruits = ["Apples", "Oranges", "Grapes"];
    printFruits(",", title = "Available Fruits: ", ...fruits);
}